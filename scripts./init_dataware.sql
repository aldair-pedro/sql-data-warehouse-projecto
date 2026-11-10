Propósito do script:
  Esse script cria uma nova base de dados chamada 'DataWarehouse' e adiciona nela 3 esquemas 'bronze','silver' e 'gold'


Criar base de dados 'DataWarehouse e esquemas'
    
---Criar a base de dados DataWarehouse
CREATE DATABASE DataWarehouse;

---Criar esquemas
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
