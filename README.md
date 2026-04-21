# Brain Tumor Detection using Hadoop, HDFS, YARN, Spark and Deep Learning

## Contributors

- U23AI016 — Kavisha  
- U23AI025 — Kartik  
- U23AI039 — Ankit  
- U23AI085 — Dushyant  

---

## Project Overview

This project implements distributed Brain Tumor MRI classification using a Hadoop cluster with Spark and Deep Learning.

The project combines:

- HDFS for distributed storage  
- YARN for cluster resource management  
- Spark / PySpark for distributed data analysis  
- TensorFlow / Keras based model training  
- MobileNetV2 for brain tumor classification  

---

## Architecture

Master-Slave Hadoop Cluster

- Master Node  
- One Slave Node  
- HDFS Distributed Storage  
- YARN Resource Scheduling  
- Spark Distributed Processing  
- Deep Learning Training Pipeline  

---

## Workflow

### Step 1: Hadoop Cluster Setup

- Configured master and slave nodes  
- Set up SSH communication  
- Configured Hadoop services  
- Started HDFS and YARN  

---

### Step 2: Dataset Upload to HDFS

Brain Tumor MRI dataset uploaded using HDFS commands.

Dataset path:

```bash
hdfs:///user/hadoop/brain_tumor/dataset
```

---

### Step 3: Distributed Data Processing using Spark

Spark setup and distribution handled through:

```bash
scripts/create_spark_distribution.sh
```

This performs:

- Creates Spark distribution script  
- Reads data from HDFS  
- Counts MRI images  
- Creates partitions  
- Distributes processing across cluster  
- Shows class-wise distribution  

---

### Step 4: Model Training

MobileNetV2 used for tumor classification.

Classes:

- Glioma  
- Meningioma  
- Pituitary  
- No Tumor  

Training included:

- Transfer Learning  
- Batch Normalization  
- Dropout  
- Multi-class Classification  

---

## Technologies Used

- Ubuntu 24.04  
- Hadoop 3.3.6  
- HDFS  
- YARN  
- Spark  
- PySpark  
- TensorFlow  
- Keras  
- MobileNetV2  
- Python  

---

## Repository Structure

```text
brain-tumor-hadoop-spark/
│
├── experiment_results/
│   ├── HDFS_NameNode_Overview.jpeg
│   ├── HDFS_DataNode_Status.jpeg
│   ├── Hadoop_Logs_View.jpeg
│   ├── Dataset_Directory_Structure.jpeg
│   ├── Project_Folders_Creation.jpeg
│   ├── Model_Training_Execution.jpeg
│   ├── YARN_Applications_Dashboard.jpeg
│   ├── YARN_Scheduler_Status.jpeg
│   ├── Cluster_Nodes_Status.jpeg
│   └── YARN_Cluster_Status.jpeg
│
├── scripts/
│   └── create_spark_distribution.sh
│
└── README.md
```

---

## Screenshots Included

Project includes execution screenshots for:

- NameNode Overview  
- DataNode Status  
- Hadoop Logs  
- Dataset Distribution  
- Spark Processing  
- Model Training  
- YARN Scheduler  
- Cluster Nodes  

---

## Run Commands

Start Hadoop:

```bash
start-dfs.sh
start-yarn.sh
```

Check cluster:

```bash
hdfs dfsadmin -report
jps
```

Run Spark:

```bash
bash scripts/create_spark_distribution.sh
spark-submit ~/brain_tumor_project/spark_distribution.py
```

---

## Dataset

Brain Tumor MRI Dataset

Source:

https://www.kaggle.com/datasets/masoudnickparvar/brain-tumor-mri-dataset

Total Images:

~7000 MRI images

---

## Future Improvements

- Add evaluation metrics  
- Add confusion matrix  
- Add multi-slave scaling  
- Add automated distributed training  

---

## Project Status

Completed

- Hadoop Cluster Configured  
- HDFS Data Distributed  
- Spark Data Processing Completed  
- MobileNetV2 Training Completed  
