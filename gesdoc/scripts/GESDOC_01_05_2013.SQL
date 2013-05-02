-- Create table
create table MENU
(
  COD_MENU number,
  NOM_MENU varchar2(50)
)
tablespace GESDOC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
  
/
  
-- Create/Recreate primary, unique and foreign key constraints 
alter table MENU
  add constraint PK_MENU primary key (COD_MENU);  
  
/

-- Create sequence 
create sequence SQ_MENU
minvalue 1
maxvalue 9999999999999999999999999
start with 1
increment by 1
nocache;

/

create or replace trigger TG_B_I_MENU
  before insert on menu  
  for each row
declare
  -- local variables here
  nPROX    NUMBER;
begin
  SELECT SQ_MENU.NEXTVAL 
   INTO nPROX FROM DUAL;
   
 :NEW.COD_MENU := nPROX;
   
end TG_B_I_MENU;

/

create or replace trigger TG_B_IU_MENU
  before INSERT OR UPDATE on menu  
  for each row
declare
  -- local variables here
begin
  :NEW.NOM_MENU := UPPER(:NEW.NOM_MENU);
end TG_B_IU_MENU;

/

-- Add/modify columns 
alter table USU_WEBDEPTO add COD_SENHA varchar2(15);

/

DROP TABLE USU_WEBDEPTO;

/

-- Create table
create table USUARIO
(
  COD_USUARIO NUMBER not null,
  NOM_USUARIO VARCHAR2(100),
  SQ_DEPTO    NUMBER not null,
  COD_EMPRESA NUMBER not null,
  COD_SENHA   VARCHAR2(15)
)
tablespace GESDOC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table USUARIO
  add constraint PK_USU_WEBDEPTO primary key (COD_USUARIO)
  using index 
  tablespace GESDOC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table USUARIO
  add constraint FK_USU_WEBDEPTO#DEPARTAMENTO foreign key (SQ_DEPTO)
  references DEPARTAMENTO (SQ_DEPTO);
alter table USUARIO
  add constraint FK_USU_WEBDEPTO#EMPRESA foreign key (COD_EMPRESA)
  references EMPRESA (COD_EMPRESA);
  
/

-- Create sequence 
create sequence SQ_USUARIO
minvalue 1
maxvalue 9999999999999999999999999
start with 1
increment by 1
nocache;

/

create or replace trigger TG_B_I_USUARIO
  before insert on usuario  
  for each row
declare
  -- local variables here
  nPROX    NUMBER;
begin
  SELECT SQ_USUARIO.NEXTVAL
   INTO nPROX FROM DUAL;
   
  :NEW.COD_USUARIO := nPROX;
    
end TG_B_I_USUARIO;

/

-- Add/modify columns 
alter table USUARIO add NOM_LOGIN varchar2(30);

/

create or replace trigger TG_B_IU_USUARIO
  before INSERT OR UPDATE on usuario  
  for each row
declare
  -- local variables here
begin
  :NEW.NOM_USUARIO := UPPER(:NEW.NOM_USUARIO);
  :NEW.COD_SENHA   := UPPER(:NEW.COD_SENHA);
  :NEW.NOM_LOGIN   := UPPER(:NEW.NOM_LOGIN);
end TG_B_IU_USUARIO;

/

-- Create table
create table PRIVILEGIO
(
  COD_MENU     number,
  COD_USUARIO  number,
  SIT_INCLUI   char(1) default 'N',
  SIT_ALTERA   char(1) default 'N',
  SIT_EXCLUI   char(1) default 'N',
  SIT_CONSULTA char(1) default 'N'
)
tablespace GESDOC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table PRIVILEGIO
  add constraint PK_PRIVILEGIO primary key (COD_MENU, COD_USUARIO);
alter table PRIVILEGIO
  add constraint FK_PRIVILEGIO#MENU foreign key (COD_MENU)
  references MENU (COD_MENU);
alter table PRIVILEGIO
  add constraint FK_PRIVILEGIO#USUARIO foreign key (COD_USUARIO)
  references USUARIO (COD_USUARIO);
  
/

  
  

  