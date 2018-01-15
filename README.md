# TN_test_GNL

The purpose of this shell script is to provide tests for the get_next_line project.
get_next_line is a function that reads a line ending with a newline character from a file descriptor, thus allowing to save/use a given text file line by line if called in a loop.

It tests 15 relevant examples of text, with 5 different buff sizes (1, 2, 5, 1,000 and 1,000,000), from files and standard input. For each test, the program also checks memory leaks using the native leaks tool from Mac and valgrind (both only supported on the Macs at 42).

## Installing & running the tests

To install it, simply put the content of the TN_test_GNL folder in your get_next_line folder, then do :

```
sh TN_test_GNL.sh
```

get_next_line subject : [Subject](https://www.dropbox.com/s/dum2raheu2wfes7/get_next_line.en.pdf?dl=0)

## Authors

* **Victor Tenneroni** - [Website](http://victor-tenneroni.com/)
* **tbailly-**
