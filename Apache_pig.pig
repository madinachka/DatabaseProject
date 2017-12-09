pubgene = LOAD '/home/hduser/data/gene2pubtator_processed.txt' USING PigStorage('\t') AS (articleID:int, geneID:int, mention2:chararray, idk2:chararray);
pubgene_sub = FOREACH pubgene GENERATE articleID, geneID;
pubmesh = LOAD '/home/hduser/data/disease2pubtator.txt' USING PigStorage('\t') AS (articleID:int, meshID:chararray, mention:chararray, idk:chararray);
pubmesh_sub = FOREACH pubmesh GENERATE articleID, meshID;
join_data = JOIN pubgene_sub BY (articleID), pubmesh_sub BY (articleID);
STORE join_data INTO 'hbase://meshSum' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage('pm_data:geneID, pm_data:articleID, pm_data:meshID');