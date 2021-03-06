DROP DATABASE IF EXISTS ${hiveconf:DBNAME} CASCADE;
CREATE DATABASE IF NOT EXISTS ${hiveconf:DBNAME};

USE ${hiveconf:DBNAME};

DROP TABLE IF EXISTS lineitem;
CREATE EXTERNAL TABLE IF NOT EXISTS lineitem 
(L_ORDERKEY BIGINT,
 L_PARTKEY BIGINT,
 L_SUPPKEY BIGINT,
 L_LINENUMBER INT,
 L_QUANTITY DOUBLE,
 L_EXTENDEDPRICE DOUBLE,
 L_DISCOUNT DOUBLE,
 L_TAX DOUBLE,
 L_RETURNFLAG STRING,
 L_LINESTATUS STRING,
 L_SHIPDATE STRING,
 L_COMMITDATE STRING,
 L_RECEIPTDATE STRING,
 L_SHIPINSTRUCT STRING,
 L_SHIPMODE STRING,
 L_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE 
LOCATION '${hiveconf:LOCATION}/lineitem/';

DROP TABLE IF EXISTS part;
CREATE EXTERNAL TABLE IF NOT EXISTS part 
(P_PARTKEY BIGINT,
 P_NAME STRING,
 P_MFGR STRING,
 P_BRAND STRING,
 P_TYPE STRING,
 P_SIZE INT,
 P_CONTAINER STRING,
 P_RETAILPRICE DOUBLE,
 P_COMMENT STRING) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE 
LOCATION '${hiveconf:LOCATION}/part/';

DROP TABLE IF EXISTS supplier;
CREATE EXTERNAL TABLE IF NOT EXISTS supplier 
(S_SUPPKEY BIGINT,
 S_NAME STRING,
 S_ADDRESS STRING,
 S_NATIONKEY BIGINT,
 S_PHONE STRING,
 S_ACCTBAL DOUBLE,
 S_COMMENT STRING) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE 
LOCATION '${hiveconf:LOCATION}/supplier/';

DROP TABLE IF EXISTS partsupp;
CREATE EXTERNAL TABLE IF NOT EXISTS partsupp 
(PS_PARTKEY BIGINT,
 PS_SUPPKEY BIGINT,
 PS_AVAILQTY INT,
 PS_SUPPLYCOST DOUBLE,
 PS_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION'${hiveconf:LOCATION}/partsupp';

DROP TABLE IF EXISTS nation;
CREATE EXTERNAL TABLE IF NOT EXISTS nation 
(N_NATIONKEY BIGINT,
 N_NAME STRING,
 N_REGIONKEY BIGINT,
 N_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '${hiveconf:LOCATION}/nation';

DROP TABLE IF EXISTS region;
CREATE EXTERNAL TABLE IF NOT EXISTS region 
(R_REGIONKEY BIGINT,
 R_NAME STRING,
 R_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '${hiveconf:LOCATION}/region';

DROP TABLE IF EXISTS customer;
CREATE EXTERNAL TABLE IF NOT EXISTS customer 
(C_CUSTKEY BIGINT,
 C_NAME STRING,
 C_ADDRESS STRING,
 C_NATIONKEY BIGINT,
 C_PHONE STRING,
 C_ACCTBAL DOUBLE,
 C_MKTSEGMENT STRING,
 C_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '${hiveconf:LOCATION}/customer';

DROP TABLE IF EXISTS orders;
CREATE EXTERNAL TABLE IF NOT EXISTS orders 
(O_ORDERKEY BIGINT,
 O_CUSTKEY BIGINT,
 O_ORDERSTATUS STRING,
 O_TOTALPRICE DOUBLE,
 O_ORDERDATE STRING,
 O_ORDERPRIORITY STRING,
 O_CLERK STRING,
 O_SHIPPRIORITY INT,
 O_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION '${hiveconf:LOCATION}/orders';