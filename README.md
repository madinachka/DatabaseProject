# DatabaseProject
Database project for CSC 450

#To download the data set, follow these instructions

File: disease2pubtator (download from PubTator, ftp://ftp.ncbi.nlm.nih.gov/pub/lu/PubTator/)
Processing: replace "MESH:" with "",

    ## Mac OS
    sed -i .bak 's/MESH://g' /Users/administrator/Desktop/disease2pubtator

    ## Linux
    sed -i 's/MESH://g' /Users/administrator/Desktop/disease2pubtator

    ## Windows - use Windows Subsystem for Linux available in the Windows Store or use find
    ##           and replace with preferred text editor 
    
    
File: gene2pubtator_processed
Processing: Download gene2pubtator from PubTator, ftp://ftp.ncbi.nlm.nih.gov/pub/lu/PubTator/)
            then process using splitLines script (because some PMIDs include 
            multiple genes listed together)  
            
#Inserting data to MySQL and HBase   

For MySQL: Use DCAST-2017-11-02.DDL to insert the data set into MySQL

For HBase: Use Apache_pig.pig to process the data set and insert into HBase

#To run the query

For MySQL: Run MySQL_Query.sql

For HBase: Run code in Hbase_Query.txt in HBase Shell
