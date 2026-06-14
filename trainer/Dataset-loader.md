

## Dataset Loading

MVE trainer support the legacy dataset structure of DeepFaceLab (DFL) .pak and the new dataset structure .pak2 that is used for both dataset and internal cache.
New .pak2 format is based on the LMDB database. It has better performance and stability compared to the old .pak format, but it is not compatible with DFL. The trainer can load both .pak and .pak2 formats.

Biggest advantage in using a dataset file compared to an image folder is checking for changes when data loading. Instead of checking each image file for changes, it checks the dataset file for changes, which is much faster.

It is recommended to convert to your dataset to .pak2 format as it more secure. It doesn't save any python objects, everything is serialized to static data.

Old cache will get auto converted to the new dataset format and removed after the conversion, so you can switch to the new format without worrying about the old cache.


## Dataset .bat scripts

### Dataset unpack

Unpacks the .pak2 dataset files to the aligned folder, depending on the src or dst it will unpack to the appropriate aligned folder.

### Dataset pack

Packs the dataset files to the .pak2 format, depending on the src or dst it will pack the appropriate aligned folder

### Legacy convert

Convert the old .pak format to the new .pak2 format, it will try to find the old .pak file in the same directory as the new .pak2 file and convert it if it exists, after the conversion it will remove the old .pak file. It can be used to convert the old dataset to the new format.
