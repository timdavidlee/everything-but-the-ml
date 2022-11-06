# The big boring article on comma-separated files (CSVs)

#### and their cousins TSV (tab-separated-files)

`CSV` files are everywhere and can be read by any program ranging from:

- python
- microsoft excel
- java
- text editors

### CSV

At its core, its a **specific text format** to represent a **table**, or **tabular data**. So given the table below:

|Product | Date | Name | Notes|
|--------|------|------|------|
|Coffee  | 2011-02-05 | Stark's Beans | a good cup of coffee |
|Gloves  | 2011-02-07 | Harry's Hands | |
|Portal Gun  | 2032-02-05 | Rick's Portal Gun | found this in on the floor |

The corresponding text file would look like this:

```
Product,Date,Name,Notes
Coffee,2011-02-05,"Stark's Beans","a good cup of coffee"
Gloves,2011-02-07,"Harry's Hands",
"Portal Gun",2032-02-05,"Rick's Portal Gun","found this in on the floor"
```

**Observations**

- The lines are 1:1 with the table
- Note that the values in each column are separated with commas `,`
- Any text with spaces in the phrase are surrounded by quotes (single or double) `" "`

### TSV

Given the same table above, the tab separated version would look like the following:

```
Product Date    Name    Notes
Coffee  2011-02-05  "Stark's Beans" "a good cup of coffee"
Gloves  2011-02-07  "Harry's Hands" 
"Portal Gun"  2032-02-05  "Rick's Portal Gun" "found this in on the floor"
```

And what can't be visually seen is the `\t` characters separating the values in each row:

```
Product\tDate\tName\tNotes
Coffee\t2011-02-05\t"Stark's Beans"\t"a good cup of coffee"
Gloves\t2011-02-07\t"Harry's Hands"\t
"Portal Gun"\t2032-02-05\t"Rick's Portal Gun"\t"found this in on the floor"
```

## Perils, Troubles, and Caveats

#### 1. Not Quoted correctly:

One of the biggest issues with the file format is when the values conflict with delimiter.

|Message | Date |
|--------|------|
|So, I like didn't, have enough patience, to write, this, correctly  | 2011-02-05 |

When the CSV format

```
Message,Date
So, I like didn't, have enough patience, to write, this, correctly,2011-02-05 
```

Note that the quoting wasn't added correctly, so the computer program will try to do the following:

|Message | Date ||||||
|----|--------------|---------------------|--------|----|---------|----------|
| So | I like didn't| have enough patience|to write|this|correctly|2011-02-05|

And typically any method being used to read the file will error out.

#### 2. Wrong Separator:

Just because the file is named `.csv` doesn't mean the separator is actually a `,`. Sometimes its a `\t`(tab), sometimes its a semicolon (`;`). Be sure to peek at the file before trying to load it in!


#### 3. Heading isn't data

When the text data looks like this:

```
Num1,Num2,Num3,Num4
1,2,3,4
```

Some program will require you to specify `row 1 are HEADERS not DATA`

#### 4. Headers don't match the data**

The simplest error, 

```
Data1,Data2,Data3
1,A,B,C
2,D,E,F
3,G,H,I
```

The above only has 3 column headers, but the data has 4 values. **This usually happens because of a header-less index.** Look at the table below. Some data representations will have a `row-id` like index or counter, that doesn't write a header column when going to file

|??|Data1|Data2|Data3|
|--|---|----|---|
|1|A|B|C|
|2|D|E|F|
|3|G|H|I|



## Python notes on CSV

Python out of the box comes with a `csv` library with some helpful tools:

[Base python csv library docs](https://docs.python.org/3/library/csv.html)

```
The csv module defines the following constants:

csv.QUOTE_ALL
Instructs writer objects to quote all fields.

csv.QUOTE_MINIMAL
Instructs writer objects to only quote those fields which contain special characters
such as delimiter, quotechar or any of the characters in lineterminator.

csv.QUOTE_NONNUMERIC
Instructs writer objects to quote all non-numeric fields.

Instructs the reader to convert all non-quoted fields to type float.

csv.QUOTE_NONE
Instructs writer objects to never quote fields. When the current delimiter occurs in output
data it is preceded by the current escapechar character. If escapechar is not set,
the writer will raise Error if any characters that require escaping are encountered.
```

Example:

```python
import csv
import pandas as pd

df = pd.DataFrame([
    [1, 2, "a", "bobby, the giant"],
    [2, 3, "b", "I, uh, think, uh"],
    [4, 6, "f", "eee"],
])

df.to_csv(quoting=csv.QUOTE_NONE, quotechar='"', escapechar="\\")

>>> ',0,1,2,3\n0,1,2,a,bobby\\, the giant\n1,2,3,b,I\\, uh\\, think\\, uh\n2,4,6,f,eee\n'
```