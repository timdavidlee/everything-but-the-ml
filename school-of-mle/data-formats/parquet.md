# Parquet, Arrow, and Columnar formats


## TLDR

when performing `python` data analysis work in dataframes, `parquet` or `feather` (both columnar methods) are preferred for saving data for the following reasons

- python libraries `fastparquet`, `pyarrow`, or `feather-format` work great with pandas for data storage
- no parsing issues reading in text with quotes (see CSV)
- can read in only the columns that required (instead of the whole file)
- reading + writing to disk is extremely efficient

## Introduction

From the apache website [https://parquet.apache.org/](https://parquet.apache.org/):

> Apache Parquet is an open source, column-oriented data file format designed for efficient data storage and retrieval. It provides efficient data compression and encoding schemes with enhanced performance to handle complex data in bulk.

- `Apache Arrow`: is an open, language-independent columnar **memory format** for flat and hierarchical data, organized for efficient analytic operations.
- `Apache Parquet`: is an open, column-oriented **data file format** designed for very efficient data encoding and retrieval
- `Arrow` is often used to process data stored in `parquet` files

There's a more indepth article found on the apache site [here](https://arrow.apache.org/blog/2022/10/05/arrow-parquet-encoding-part-1/)


## Comparing the performance of `csv` vs. `parquet`

```python
import os
import csv
import numpy as np  # to generate data
from humanfriendly import format_size
from fastparquet import ParquetFile

rows = 10_000
cols = 100
bunch_of_decimals = np.round(np.random.rand(rows, cols), 4)
list_of_list_of_decimals = bunch_of_decimals.tolist()
```

What the data looks like

```python
list_of_list_of_decimals[0]
>>>[0.0428,
    0.5884,
    0.4702,
    0.4012,
    0.6029,
    0.1236,
    0.3198,
    ...
```

### Writing a moderate amount of data: 10k rows X 100 cols

First as a CSV

```python
%%timeit
with open("/tmp/sample.csv", "w") as csv_file:
    my_writer = csv.writer(csv_file, delimiter=",")
    for row in list_of_list_of_decimals:
        my_writer.writerow(row)

>>> 550 ms ± 21.8 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
```


```python
format_size(os.path.getsize("/tmp/sample.csv"))
>>> '6.9 MB'
```

Then as a parquet file, which writes 5x faster

```python
%%timeit
sample_data_table = pyarrow.table(
    list_of_list_of_decimals_transpose,
    names=[f"col{j}" for j in range(cols)]
)
pq.write_table(sample_data_table, "/tmp/sample.pq")

>>> 103 ms ± 9.71 ms per loop (mean ± std. dev. of 7 runs, 10 loops each)
```

```python
format_size(os.path.getsize("/tmp/sample.pq"))

>>> '4.87 MB'
```

### Writing a larger dataset: 1M rows X 200 cols

For comparison, using the dataframes library `pandas` to read and write both formats

```python
import pandas as pd
import numpy as np
from humanfriendly import format_size

rows = 100_000
cols = 100
bunch_of_decimals = np.round(np.random.rand(rows, cols), 4)

decimal_df = pd.DataFrame(
    bunch_of_decimals,
    columns=[f"col{j}" for j in range(cols)]
)
```


#### Writing speed comparison

With the increase of rows, the writing time becomes very long, and parquet starts showing its

```python
%%timeit
decimal_df.to_csv("/tmp/sample.csv")

>>> 8.58 s ± 739 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
```

```python
%%timeit
decimal_df.to_parquet("/tmp/sample.parquet")

>>> 531 ms ± 102 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
```

#### Reading speed comparison

The reading time is similarly affected:

```python
%%timeit
pd.read_csv("/tmp/sample.csv")

>>> 1.18 s ± 115 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
```


```python
%%timeit
pd.read_parquet("/tmp/sample.parquet")

>>> 72.4 ms ± 7.03 ms per loop (mean ± std. dev. of 7 runs, 10 loops each)
```

## Partitioning

There's another advantage to `parquet` and thats formatting. Using the same large dataset, another column will be added:

```python
import pandas as pd
import numpy as np

rows = 100_000
cols = 100
bunch_of_decimals = np.round(np.random.rand(rows, cols), 4)

decimal_df = pd.DataFrame(
    bunch_of_decimals,
    columns=[f"col{j}" for j in range(cols)]
)

decimal_df["partition_col"] = np.random.choice(range(10), size=rows, replace=True)
decimal_df["partition_col"].value_counts()
```

The partition column will have values from `0-9`

```
8    10165
3    10111
6    10064
2    10023
4     9999
7     9993
0     9977
9     9931
5     9870
1     9867
```

This column is used as a basis to split the dataset into multiple files. Note that the write speed is marginally more efficient.

```python
%%timeit
decimal_df.to_parquet("/tmp/sample_partitioned.pq", partition_cols=["partition_col"])

>>> 405 ms ± 10.2 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
```

