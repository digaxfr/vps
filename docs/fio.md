# fio

https://dotlayer.com/how-to-use-fio-to-measure-disk-performance-in-linux/
https://www.storagereview.com/fio_flexible_i_o_tester_synthetic_benchmark
https://tobert.github.io/post/2014-04-17-fio-output-explained.html

```
fio --randrepeat=1 --ioengine=libaio --direct=1 --name=test --filename=random_read_write.fio --bs=4k --iodepth=1 --size=4G --readwrite=randrw --rwmixread=75 --runtime=60
```
