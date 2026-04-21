cat > ~/brain_tumor_project/spark_distribution.py << 'PYEOF'
from pyspark.sql import SparkSession
from pyspark.sql.functions import input_file_name, regexp_extract, lit

spark = SparkSession.builder.appName("Brain Tumor Data Distribution").config("spark.executor.memory", "512m").config("spark.driver.memory", "512m").getOrCreate()

spark.sparkContext.setLogLevel("WARN")

print("="*60)
print("SPARK DISTRIBUTED DATA PROCESSING")
print("Master  :", spark.sparkContext.master)
print("App ID  :", spark.sparkContext.applicationId)
print("Workers :", spark.sparkContext.defaultParallelism)
print("="*60)

TRAIN = "hdfs:///user/hadoop/brain_tumor/dataset/Training"
TEST  = "hdfs:///user/hadoop/brain_tumor/dataset/Testing"

train_df = spark.read.format("binaryFile").option("pathGlobFilter", "*.jpg").option("recursiveFileLookup", "true").load(TRAIN)
test_df  = spark.read.format("binaryFile").option("pathGlobFilter", "*.jpg").option("recursiveFileLookup", "true").load(TEST)

train_count = train_df.count()
test_count  = test_df.count()

print("Total Training images :", train_count)
print("Total Testing  images :", test_count)
print("Total images          :", train_count + test_count)
print("Train partitions      :", train_df.rdd.getNumPartitions())
print("Test  partitions      :", test_df.rdd.getNumPartitions())

train_df.select(input_file_name().alias("filepath")).withColumn("label", regexp_extract(input_file_name(), r"/([^/]+)/[^/]+\.jpg$", 1)).groupBy("label").count().orderBy("label").show()

test_df.select(input_file_name().alias("filepath")).withColumn("label", regexp_extract(input_file_name(), r"/([^/]+)/[^/]+\.jpg$", 1)).groupBy("label").count().orderBy("label").show()

print("SPARK DISTRIBUTED PROCESSING COMPLETE!")
spark.stop()
PYEOF
echo "Done!"