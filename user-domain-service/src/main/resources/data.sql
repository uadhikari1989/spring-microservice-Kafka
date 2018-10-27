drop table users;
drop table Roles;
drop table user_roles;

CREATE TABLE "DEV_USER"."USERS" 
   ("ID" NUMBER(19,0) GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOT NULL ENABLE,  
	"NAME" VARCHAR2(50) NOT NULL ENABLE, 
	"USERNAME" VARCHAR2(15), 
	"EMAIL" VARCHAR2(40) NOT NULL ENABLE, 
	"PASSWORD" VARCHAR2(100) NOT NULL ENABLE, 
	"CREATED_AT" TIMESTAMP (6) DEFAULT NULL, 
	"UPDATED_AT" TIMESTAMP (6) DEFAULT NULL, 
	 CONSTRAINT "USERS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


CREATE TABLE roles (
 id NUMBER(19,0) GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOT NULL ENABLE,
  name varchar(60) NOT NULL,
 CONSTRAINT roles_pk PRIMARY KEY (id)
 
) ;

CREATE TABLE user_roles  (
  user_id  number(10) NOT NULL,
  role_id  number(10) NOT NULL,
  CONSTRAINT user_roles_pk PRIMARY KEY (user_id,role_id),
  CONSTRAINT fk_user_roles_role_id FOREIGN KEY (role_id) REFERENCES roles (id),
  CONSTRAINT fk_user_roles_user_id FOREIGN KEY (user_id) REFERENCES users (id)
) 