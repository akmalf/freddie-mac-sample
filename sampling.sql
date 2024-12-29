DROP TABLE IF EXISTS originations;

CREATE TABLE originations (
	fico BIGINT,
	dt_first_pi BIGINT,
	flag_fthb VARCHAR,
	dt_matr VARCHAR,
	cd_msa BIGINT,
	mi_pct VARCHAR,
	cnt_units BIGINT,
	occpy_sts VARCHAR,
	cltv BIGINT,
	dti BIGINT,
	orig_upb BIGINT,
	ltv BIGINT,
	orig_int_rt VARCHAR,
	channel VARCHAR,
	ppmt_pnlty VARCHAR,
	amrtzn_type VARCHAR,
	st VARCHAR,
	prop_type VARCHAR,
	zipcode VARCHAR,
	id_loan VARCHAR PRIMARY KEY,
	loan_purpose VARCHAR,
	orig_loan_term VARCHAR,
	cnt_borr VARCHAR,
	seller_name VARCHAR,
	servicer_name VARCHAR,
	flag_sc VARCHAR,
	id_loan_preharp VARCHAR,
	ind_afdl VARCHAR,
	ind_harp VARCHAR,
	cd_ppty_val_type VARCHAR,
	flag_int_only VARCHAR
);

INSERT INTO originations
SELECT * FROM read_csv('D:\collections\Raw Data\Freddie Mac\originations_data\*.txt', delim='|')
;

ALTER TABLE originations ALTER dt_first_pi TYPE VARCHAR;
ALTER TABLE originations ALTER cd_msa TYPE VARCHAR;

SELECT * FROM originations LIMIT 100;

DROP TABLE IF EXISTS performance;

CREATE TABLE performance(
	id_loan VARCHAR,
	period BIGINT,
	curr_act_upb DOUBLE,
	delq_sts VARCHAR,
	loan_age VARCHAR,
	mths_remng VARCHAR,
	dt_dfct_setlmt BIGINT,
	flag_mod VARCHAR,
	cd_zero_bal VARCHAR,
	dt_zero_bal BIGINT,
	cur_int_rt DOUBLE,
	cur_dfrd_upb DOUBLE,
	dt_lst_pi BIGINT,
	mi_recoveries BIGINT,
	net_sale_proceeds BIGINT,
	non_mi_recoveries BIGINT,
	expenses BIGINT,
	legal_costs BIGINT,
	maint_pres_costs BIGINT,
	taxes_ins_costs BIGINT,
	misc_costs BIGINT,
	actual_loss BIGINT,
	modcost DOUBLE,
	stepmod_ind VARCHAR,
	dpm_ind VARCHAR,
	eltv BIGINT,
	zb_removal_upb DOUBLE,
	dlq_acrd_int BIGINT,
	disaster_area_flag VARCHAR,
	borr_assist_ind VARCHAR,
	monthly_modcost DOUBLE,
	amt_int_brng_upb DOUBLE
)
;

INSERT INTO performance
SELECT * FROM read_csv('D:\collections\Raw Data\Freddie Mac\historical_performance\*.txt', delim='|')
;

ALTER TABLE performance ALTER period TYPE VARCHAR;

SELECT * FROM performance LIMIT 100;

DROP TABLE sampler;

CREATE TABLE sampler AS
SELECT * FROM originations
WHERE id_loan LIKE 'F20Q1%'
LIMIT 9572
;

SELECT * FROM sampler;

DROP TABLE performance_sampler;

CREATE TABLE performance_sampler as
SELECT * FROM performance
WHERE id_loan IN (SELECT id_loan FROM sampler)
--AND period <= "202103"
;

SELECT * FROm performance_sampler
WHERE id_loan = 'F20Q10002392'

SELECT * FROM sampler WHERE id_loan = 'F20Q10002392'