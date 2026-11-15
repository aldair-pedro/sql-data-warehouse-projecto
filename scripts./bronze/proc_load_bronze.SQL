/*
============================================================================================================
Procedimento armazenado: Carregar Camada Bronze (Origem ---> Bronze)
============================================================================================================
Propósito do Script:
      Esse procedimento armazenado carrega o dado dentro do esquema 'bronze' de ficheiros CSV externos.
      Funcionamneto:
      - Trunca as tabelas bronze antes do carregamento
      - Usa O Comando 'COPY' para carregar dados do ficheiro csv para as tabelas bronze.
============================================================================================================
Parâmetros:
    None.
    Esse procedimento não aceita algum parâmetro ou retorna algum valor
Exemplo de uso:
    CALL bronze.load_bronze();
============================================================================================================
*/

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE 'plpgsql'
AS $BODY$

BEGIN
	
	RAISE NOTICE '====================================';
	RAISE NOTICE 'Carregar Camada Bronze';
	RAISE NOTICE '====================================';

	RAISE NOTICE '----------------------------------';
	RAISE NOTICE 'Carregar Tabelas CRM';
	RAISE NOTICE '----------------------------------';

	RAISE NOTICE '»» Truncar Tabela: bronze.crm_cust_info';
	TRUNCATE TABLE bronze.crm_cust_info;

	RAISE NOTICE 'Inserir Dados em: bronze.crm_cust_info';
	COPY bronze.crm_cust_info
	FROM 'C:\Users\AP\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	WITH(
		FORMAT CSV,
		HEADER TRUE,
		DELIMITER ','
	);

	RAISE NOTICE '»» Truncar Tabela: bronze.crm_prd_info';
	TRUNCATE TABLE bronze.crm_prd_info;

	RAISE NOTICE 'Inserir Dados em: bronze.crm_prd_info';
	COPY bronze.crm_prd_info
	FROM 'C:\Users\AP\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	WITH(
		FORMAT CSV,
		HEADER TRUE,
		DELIMITER ','
	);
	
	RAISE NOTICE '»» Truncar Tabela: bronze.crm_sales_details';
	TRUNCATE TABLE bronze.crm_sales_details;

	RAISE NOTICE 'Inserir Dados em: bronze.crm_sales_details';
	COPY bronze.crm_sales_details
	FROM 'C:\Users\AP\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	WITH(
		FORMAT CSV,
		HEADER TRUE,
		DELIMITER ','
	);

	RAISE NOTICE '----------------------------------';
	RAISE NOTICE 'Carregar Tabelas ERP';
	RAISE NOTICE '----------------------------------';

	RAISE NOTICE '»» Truncar Tabela: bronze.erp_cust_az12';
	TRUNCATE TABLE bronze.erp_cust_az12;

	RAISE NOTICE 'Inserir Dados em: bronze.erp_cust_az12';
	COPY bronze.erp_cust_az12
	FROM 'C:\Users\AP\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	WITH(
		FORMAT CSV,
		HEADER TRUE,
		DELIMITER ','
	);
	
	RAISE NOTICE '»» Truncar Tabela: bronze.erp_loc_a101';
	TRUNCATE TABLE bronze.erp_loc_a101;
	
	RAISE NOTICE 'Inserir Dados em: bronze.erp_loc_a101';
	COPY bronze.erp_loc_a101
	FROM 'C:\Users\AP\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	WITH(
		FORMAT CSV,
		HEADER TRUE,
		DELIMITER ','
	);
	RAISE NOTICE '»» Truncar Tabela: bronze.erp_px_cat_g1v2';
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;

	RAISE NOTICE 'Inserir Dados em: bronze.erp_px_cat_g1v2';
	COPY bronze.erp_px_cat_g1v2
	FROM 'C:\Users\AP\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH(
		FORMAT CSV,
		HEADER TRUE,
		DELIMITER ','
	);

EXCEPTION
	WHEN OTHERS THEN
	RAISE NOTICE 'ERRO: OCORREU UM DURANTE O CARREGAMNETO DA CAMADA BRONZE! SQLERRM';
	RAISE;

END;
$BODY$;
ALTER PROCEDURE bronze.load_bronze()
    OWNER TO postgres;
