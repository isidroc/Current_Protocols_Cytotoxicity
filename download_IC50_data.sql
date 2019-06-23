use chembl_21; 

select 
chembl_21.assays.cell_id,
chembl_21.assays.assay_type,
chembl_21.assays.description,
chembl_21.assays.assay_category,
chembl_21.assays.assay_organism,
chembl_21.target_dictionary.organism,
chembl_21.target_dictionary.target_type,
chembl_21.molecule_dictionary.pref_name,
chembl_21.activities.assay_id,
chembl_21.molecule_dictionary.chembl_id,
chembl_21.activities.molregno,
chembl_21.molecule_dictionary.molecule_type,
chembl_21.activities.standard_value,
chembl_21.activities.published_value,
chembl_21.activities.standard_units,
chembl_21.activities.standard_type,
chembl_21.activities.published_relation,
chembl_21.activities.published_value,
chembl_21.activities.published_units,
chembl_21.activities.doc_id,
chembl_21.docs.journal,
chembl_21.docs.year,
chembl_21.docs.volume,
chembl_21.docs.issue,
chembl_21.docs.first_page,
chembl_21.docs.last_page,
chembl_21.docs.pubmed_id,
chembl_21.compound_properties.full_mwt,
chembl_21.compound_properties.hba,
chembl_21.compound_properties.hbd,
chembl_21.compound_properties.psa,
chembl_21.compound_properties.rtb,
chembl_21.compound_properties.acd_logp,
chembl_21.compound_properties.acd_logd,
chembl_21.compound_structures.canonical_smiles,
/*chembl_21.cell_dictionary.cell_source_tissue,
chembl_21.cell_dictionary.cell_description,*/
chembl_21.cell_dictionary.cell_source_organism,
chembl_21.cell_dictionary.cell_name,
chembl_21.cell_dictionary.clo_id,
chembl_21.cell_dictionary.efo_id,
chembl_21.cell_dictionary.cellosaurus_id
from chembl_21.target_dictionary,
chembl_21.assays,
chembl_21.activities,
chembl_21.compound_structures,
chembl_21.compound_properties,
chembl_21.molecule_dictionary,
chembl_21.cell_dictionary,
chembl_21.docs

where 
/*chembl_21.target_components.tid = chembl_21.target_dictionary.tid*/
chembl_21.target_dictionary.tid = chembl_21.assays.tid
and chembl_21.assays.cell_id = chembl_21.cell_dictionary.cell_id
and chembl_21.cell_dictionary.cell_id = chembl_21.assays.cell_id 
/*and chembl_21.activities.assay_id = chembl_21.assays.assay_id*/
and chembl_21.assays.assay_id = chembl_21.activities.assay_id
and chembl_21.activities.molregno = chembl_21.molecule_dictionary.molregno
and chembl_21.molecule_dictionary.molregno = chembl_21.compound_structures.molregno
and chembl_21.compound_properties.molregno = chembl_21.molecule_dictionary.molregno
and chembl_21.activities.doc_id = chembl_21.docs.doc_id
and chembl_21.activities.standard_type like 'IC50'
/*and chembl_21.activities.standard_units like 'nM'*/
and chembl_21.activities.standard_relation like '='
and chembl_21.target_dictionary.target_type = 'cell-line'
and chembl_21.cell_dictionary.cellosaurus_id like 'CVCL_0105'
