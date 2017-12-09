/**************************************************************
* DCAST 11-02-2017
*   differences between mysql and oracle
*     INT instead of, e.g. NUMBER(10,0)
*     VARCHAR(20) instead of VARCHAR2(20 BYTE)
*     Add space after first two dashes for a comment
*     Do not include database name when creating index (e.g., 
*         CREATE INDEX GENE_IX1 ... instead of
*         CREATE INDEX DCAST.GENE_IX1
**************************************************************/

-- ------------------------------------------------------
--  Create Database
-- ------------------------------------------------------
CREATE DATABASE DCAST;

-- ------------------------------------------------------
--  Create Tables
-- ------------------------------------------------------

-- ------------------------------------------------------
--  DDL for Table GENE
-- ------------------------------------------------------
CREATE TABLE DCAST.GENE 
   (	GeneID INT NOT NULL, 
    	SYMBOL VARCHAR(20)
   );

-- ------------------------------------------------------
--  DDL for Index GENE_IX1
-- ------------------------------------------------------
  CREATE INDEX GENE_IX1 ON DCAST.GENE (GeneID);

-- ------------------------------------------------------
--  DDL for Table MESH
-- ------------------------------------------------------
CREATE TABLE DCAST.MESH 
   (	MeshID VARCHAR(15) NOT NULL, 
	    MeshTerm VARCHAR(50)
    );

-- ------------------------------------------------------
--  DDL for Index MESH_IX1
-- ------------------------------------------------------
CREATE INDEX MESH_IX1 ON DCAST.MESH (MeshID);

-- ------------------------------------------------------
--  DDL for Table PubMesh
-- ------------------------------------------------------
  CREATE TABLE DCAST.PubMesh 
   (PMID INT NOT NULL, 
	  MeshID VARCHAR(15) NOT NULL, 
	  MENTIONS VARCHAR(800)
   ) ;

-- ------------------------------------------------------
--  Load data into PubMesh 
-- ------------------------------------------------------
LOAD DATA LOCAL INFILE 'data/disease2pubtator' INTO TABLE DCAST.PubMesh IGNORE 1 LINES;

-- ------------------------------------------------------
--  DDL for Index PubMesh_IX1
-- ------------------------------------------------------
CREATE INDEX PubMesh_IX1 ON DCAST.PubMesh (PMID, MeshID);

-- ------------------------------------------------------
--  DDL for Table PubGene  
-- ------------------------------------------------------
CREATE TABLE DCAST.PubGene 
   (	PMID INT  NOT NULL, 
	    GeneID INT NOT NULL
   ) ;

-- ------------------------------------------------------
--  Load data into PubGene  
-- ------------------------------------------------------
LOAD DATA LOCAL INFILE 'data/gene2pubtator_processed' INTO TABLE DCAST.PubGene IGNORE 1 LINES;

-- ------------------------------------------------------
--  DDL for Index PubGene_IX1
-- ------------------------------------------------------
CREATE INDEX PubGene_IX1 ON DCAST.PubGene (GeneID, PMID);
-- ------------------------------------------------------
--  DDL for Index ARTICLE_GENE_IX2
-- ------------------------------------------------------
CREATE INDEX PubGene_IX2 ON DCAST.PubGene (PMID);