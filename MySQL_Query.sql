
/* Summarize Mesh terms for AGL (GeneID = 178) */
select PubMesh.MeshID, count(PubMesh.MeshID) from PubMesh INNER JOIN PubGene ON PubMesh.PMID = PubGene.PMID WHERE PubGene.GeneID = "178" GROUP BY PubMesh.MeshID ORDER BY count(PubMesh.MeshID);
