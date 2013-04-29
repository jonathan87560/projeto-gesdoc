CREATE TABLE DEPARTAMENTO (
    COD_DEPTO     NUMBER NOT NULL,
    NOM_DEPTO     VARCHAR2(100),
    SIT_MODIFY        CHAR(1) 
);

-- Create sequence 
create sequence SQ_DEPTO
minvalue 1
maxvalue 9999999999999999999999999
start with 1
increment by 1
nocache;

/

create or replace trigger TG_B_I_DEPARTAMENTO
  before insert on DEPARTAMENTO  
  for each row
declare
  -- local variables here
 nPROX NUMBER;
begin

 SELECT SQ_DEPTO.NEXTVAL INTO nPROX
  FROM DUAL;
  
 :NEW.COD_DEPTO := nPROX;   

end TG_B_I_DEPARTAMENTO;

/

create or replace trigger TG_B_IU_DEPARTAMENTO
  before INSERT OR UPDATE on departamento  
  for each row
declare
  -- local variables here
begin
  :NEW.NOM_DEPTO  := UPPER(:NEW.NOM_DEPTO);
  :NEW.SIT_MODIFY := UPPER(:NEW.SIT_MODIFY);
end TG_B_IU_DEPARTAMENTO;

/

-- Create/Recreate primary, unique and foreign key constraints 
alter table DEPARTAMENTO
  add constraint PK_DEPARTAMENTO primary key (COD_DEPTO);
  
/

CREATE TABLE DEPART_COLIGS (
    COD_EMPRESA    NUMBER NOT NULL,
    COD_DEPTO      NUMBER NOT NULL,
    COD_DEP_COL    NUMBER,
    SIT_MODIFY     CHAR(1)
);

/

-- Create/Recreate primary, unique and foreign key constraints 
alter table DEPART_COLIGS
  add constraint PK_DEPART_COLIGS primary key (COD_EMPRESA, COD_DEPTO, COD_DEP_COL);
alter table DEPART_COLIGS
  add constraint FK_DEPART_COLIGS#DEPARTAMENTOS foreign key (COD_DEPTO)
  references departamento (COD_DEPTO);
alter table DEPART_COLIGS
  add constraint FK_DEPART_COLIGS#DEPARTAMENTO2 foreign key (COD_DEP_COL)
  references departamento (COD_DEPTO);
  
/

create or replace trigger TG_B_IU_DEPART_COLIGS
  before INSERT OR UPDATE on DEPART_COLIGS  
  for each row
declare
  -- local variables here
begin
  :NEW.SIT_MODIFY := UPPER(:NEW.SIT_MODIFY);
end TG_B_IU_DEPART_COLIGS;

/

CREATE TABLE EMPRESA_INT (
    COD_EMP_INT  NUMBER NOT NULL,
    NOM_EMPRESA  VARCHAR2(50),
    SIT_MODIFY   CHAR(1)
);

/

-- Create sequence 
create sequence SQ_EMPRESA_INT
minvalue 1
maxvalue 9999999999999999999999999
start with 1
increment by 1
nocache;

/

create or replace trigger TG_B_I_EMPRESA_INT
  before insert on EMPRESA_INT  
  for each row
declare
  -- local variables here
 nPROX NUMBER;
begin

 SELECT SQ_EMPRESA_INT.NEXTVAL INTO nPROX
  FROM DUAL;
  
 :NEW.COD_EMP_INT := nPROX;   

end TG_B_I_EMPRESA_INT;

/

create or replace trigger TG_B_IU_EMPRESA_INT
  before INSERT OR UPDATE on EMPRESA_INT  
  for each row
declare
  -- local variables here
begin
  :NEW.NOM_EMPRESA  := UPPER(:NEW.NOM_EMPRESA);
  :NEW.SIT_MODIFY := UPPER(:NEW.SIT_MODIFY);
end TG_B_IU_EMPRESA_INT;

/

CREATE TABLE USU_WEBDEPTO (
    COD_USUARIO   NUMBER,
    NOM_USUARIO   VARCHAR2(100),
    COD_DEPTO     NUMBER NOT NULL,
    COD_COLIGADA  NUMBER
);

/

-- Create sequence 
create sequence SQ_USU_WEBDEPTO
minvalue 1
maxvalue 9999999999999999999999999
start with 1
increment by 1
nocache;

/

-- Add/modify columns 
alter table USU_WEBDEPTO modify COD_EMPRESA not null;
-- Create/Recreate primary, unique and foreign key constraints 
alter table USU_WEBDEPTO
  drop constraint PK_USU_WEBDEPTO cascade;
alter table USU_WEBDEPTO
  add constraint PK_USU_WEBDEPTO primary key (COD_USUARIO);
alter table USU_WEBDEPTO
  add constraint FK_USU_WEBDEPTO#DEPARTAMENTO foreign key (COD_DEPTO)
  references departamento (COD_DEPTO);
alter table USU_WEBDEPTO
  add constraint FK_USU_WEBDEPTO#EMPRESA foreign key (COD_EMPRESA)
  references empresa (COD_EMPRESA);
  
/

-- Create sequence 
create sequence SQ_USUARIO_WEB_DEP
minvalue 1
maxvalue 9999999999999999999999999
start with 1
increment by 1
nocache;

/

create or replace trigger TG_B_I_USU_WEBDEPTO
  before insert on USU_WEBDEPTO  
  for each row
declare
  -- local variables here
 nPROX NUMBER;
begin

 SELECT SQ_USUARIO_WEB_DEP.NEXTVAL INTO nPROX
  FROM DUAL;
  
 :NEW.COD_USUARIO := nPROX;   

end TG_B_I_USU_WEBDEPTO;

/

create or replace trigger TG_B_IU_USU_WEBDEPTO
  before INSERT OR UPDATE on USU_WEBDEPTO  
  for each row
declare
  -- local variables here
begin
  :NEW.NOM_USUARIO  := UPPER(:NEW.NOM_USUARIO);
  
end TG_B_IU_USU_WEBDEPTO;

/

CREATE TABLE CENTRO_CUSTO (
    COD_CCUSTO   NUMBER NOT NULL,
    NOM_CCUSTO   VARCHAR2(50),
    SIT_MODIFY   CHAR(1),
    NUM_QTD      NUMBER,
    COD_DEPTO    NUMBER,
    COD_EMPRESA  NUMBER
);


/

-- Add/modify columns 
alter table CENTRO_CUSTO add NUM_CLASSI varchar2(30);

/

-- Create sequence 
create sequence SQ_CENTRO_CUSTO
minvalue 1
maxvalue 9999999999999999999999999
start with 1
increment by 1
nocache;

/

create or replace trigger TG_B_I_CENTRO_CUSTO
  before insert on CENTRO_CUSTO  
  for each row
declare
  -- local variables here
 nPROX NUMBER;
begin

 SELECT SQ_CENTRO_CUSTO.NEXTVAL INTO nPROX
  FROM DUAL;
  
 :NEW.COD_CCUSTO := nPROX;   

end TG_B_I_CENTRO_CUSTO;

/

create or replace trigger TG_B_IU_CENTRO_CUSTO
  before INSERT OR UPDATE on CENTRO_CUSTO  
  for each row
declare
  -- local variables here
begin
  :NEW.NOM_CCUSTO  := UPPER(:NEW.NOM_CCUSTO);
  :NEW.SIT_MODIFY  := UPPER(:NEW.SIT_MODIFY);
  :NEW.NUM_CLASSI  := UPPER(:NEW.NUM_CLASSI);
end TG_B_IU_CENTRO_CUSTO;

/

CREATE TABLE EMPRESTIMOS (
    COD_EMPRES    NUMBER NOT NULL,
    NOM_RESP      VARCHAR2(20),
    COD_DEPTO     NUMBER,
    NOM_RESP_EMP  VARCHAR2(20),
    NOM_OBS       VARCHAR2(255),
    SIT_MODIFY    CHAR(1),
    NUM_PADRAO    NUMBER,
    DAT_RETIRADA  DATE
);

/

-- Create sequence 
create sequence SQ_EMPRESTIMOS
minvalue 1
maxvalue 9999999999999999999999999
start with 1
increment by 1
nocache;

/

create or replace trigger TG_B_I_EMPRESTIMOS
  before insert on EMPRESTIMOS  
  for each row
declare
  -- local variables here
 nPROX NUMBER;
begin

 SELECT SQ_EMPRESTIMOS.NEXTVAL INTO nPROX
  FROM DUAL;
  
 :NEW.COD_EMPRES := nPROX;   

end TG_B_I_EMPRESTIMOS;

/

create or replace trigger TG_B_IU_EMPRESTIMOS
  before INSERT OR UPDATE on EMPRESTIMOS  
  for each row
declare
  -- local variables here
begin
  :NEW.NOM_RESP      := UPPER(:NEW.NOM_RESP);
  :NEW.NOM_RESP_EMP  := UPPER(:NEW.NOM_RESP_EMP);
  :NEW.NOM_OBS       := UPPER(:NEW.NOM_OBS);
  :NEW.SIT_MODIFY    := UPPER(:NEW.SIT_MODIFY);
end TG_B_IU_EMPRESTIMOS;

/

CREATE TABLE ITE_EMPREST (
    COD_ITE_EMP          NUMBER NOT NULL,
    COD_EMPRES           NUMBER NOT NULL,
    NUM_PADRAO           NUMBER NOT NULL,
    NUM_BOX              NUMBER NOT NULL,
    NUM_ITEM             NUMBER NOT NULL,
    DAT_DEVOL            DATE,
    SIT_MODIFY           CHAR(1)
);

/

-- Create sequence 
create sequence SQ_ITE_EMPREST
minvalue 1
maxvalue 9999999999999999999999999
start with 1
increment by 1
nocache;

/

create or replace trigger TG_B_I_ITE_EMPREST
  before insert on ITE_EMPREST  
  for each row
declare
  -- local variables here
 nPROX NUMBER;
begin

 SELECT SQ_ITE_EMPREST.NEXTVAL INTO nPROX
  FROM DUAL;
  
 :NEW.COD_ITE_EMP := nPROX;   

end TG_B_I_ITE_EMPREST;

/

create or replace trigger TG_B_IU_ITE_EMPREST
  before INSERT OR UPDATE on ITE_EMPREST  
  for each row
declare
  -- local variables here
begin
  :NEW.SIT_MODIFY    := UPPER(:NEW.SIT_MODIFY);
end TG_B_IU_ITE_EMPREST;

/

alter table EMPRESA_INT
  add constraint PK_EMPRESA_INT primary key (COD_EMP_INT);
  
/

-- Create/Recreate primary, unique and foreign key constraints 
alter table CENTRO_CUSTO
  add constraint PK_CENTRO_CUSTO primary key (COD_CCUSTO);
alter table CENTRO_CUSTO
  add constraint FK_CENTRO_CUSTO#DEPARTAMENTO foreign key (COD_DEPTO)
  references departamento (COD_DEPTO);
alter table CENTRO_CUSTO
  add constraint FK_CENTRO_CUSTO#EMPRESA foreign key (COD_EMPRESA)
  references empresa (COD_EMPRESA);

/

-- Create/Recreate primary, unique and foreign key constraints 
alter table EMPRESTIMOS
  add constraint PK_EMPRESTIMOS primary key (COD_EMPRES);
alter table EMPRESTIMOS
  add constraint FK_EMPRESTIMOS#DEPARTAMENTO foreign key (COD_DEPTO)
  references departamento (COD_DEPTO);

/

-- Create/Recreate primary, unique and foreign key constraints 
alter table ITE_EMPREST
  add constraint PK_ITE_EMPREST primary key (COD_ITE_EMP);
alter table ITE_EMPREST
  add constraint FK_ITE_EMPREST#ITE_EMPREST foreign key (COD_EMPRES)
  references emprestimos (COD_EMPRES);

/

CREATE TABLE DOCUMENTOS (
    NUM_PADRAO         NUMBER NOT NULL,
    NUM_BOX            NUMBER NOT NULL,
    NUM_ITEM           NUMBER NOT NULL,
    NUM_NUMERO         NUMBER,
    COD_DEPTO          NUMBER,
    NOM_SALA           VARCHAR2(4),
    NOM_ESTANTE        VARCHAR2(6),
    NOM_BOX_CLI        VARCHAR2(10),
    SIT_TIPO           VARCHAR2(1),
    NOM_ASSUNTO        VARCHAR2(255),
    NOM_OBS            VARCHAR2(240),
    DAT_INICIO         DATE,
    DAT_TERMINO        DATE,
    NUM_TEMPORA        NUMBER,
    NUM_ANOS           NUMBER,
    DAT_EXPURGO        VARCHAR2(6),
    COD_EMPRES         NUMBER,
    SIT_MODIFY         CHAR(1),
    COD_EMPRESA        NUMBER,
    SIT_POSICAO        CHAR(1),
    COD_CCUSTO         NUMBER,
    DAT_CADAST         DATE,
    NOM_LOCALIZA       VARCHAR2(30),
    NOM_FILME          VARCHAR2(10),
    COD_EMP_INT        NUMBER 
);

/

-- Add/modify columns 
alter table DOCUMENTOS add COD_DOCUMEN number;
-- Create/Recreate primary, unique and foreign key constraints 
alter table DOCUMENTOS
  add constraint FK_DOCUMENTOS#DEPARTAMENTO foreign key (COD_DEPTO)
  references departamento (COD_DEPTO);
alter table DOCUMENTOS
  add constraint FK_DOCUMENTOS#EMPRESTIMOS foreign key (COD_EMPRES)
  references emprestimos (COD_EMPRES);
alter table DOCUMENTOS
  add constraint FK_DOCUMENTOS#EMPRESA foreign key (COD_EMPRESA)
  references empresa (COD_EMPRESA);
alter table DOCUMENTOS
  add constraint FK_DOCUMENTOS#CENTRO_CUSTO foreign key (COD_CCUSTO)
  references centro_custo (COD_CCUSTO);
alter table DOCUMENTOS
  add constraint FK_DOCUMENTOS#EMPRESA_INT foreign key (COD_EMP_INT)
  references empresa_INT (COD_EMP_INT);
alter table DOCUMENTOS
  add constraint PK_DOCUMENTOS primary key (COD_DOCUMEN);
  
/

-- Create sequence 
create sequence SQ_DOCUMENTOS
minvalue 1
maxvalue 9999999999999999999999999
start with 1
increment by 1
nocache;

/

-- Add/modify columns 
alter table DOCUMENTOS modify DAT_EXPURGO date;

/

create or replace trigger TG_B_I_DOCUMENTOS
  before insert on DOCUMENTOS  
  for each row
declare
  -- local variables here
 nPROX NUMBER;
begin

 SELECT SQ_DOCUMENTOS.NEXTVAL INTO nPROX
  FROM DUAL;
  
 :NEW.COD_DOCUMEN := nPROX;   

end TG_B_I_DOCUMENTOS;

/

create or replace trigger TG_B_IU_DOCUMENTOS
  before INSERT OR UPDATE on DOCUMENTOS  
  for each row
declare
  -- local variables here
begin
  :NEW.NOM_SALA     := UPPER(:NEW.NOM_SALA);
  :NEW.NOM_ESTANTE  := UPPER(:NEW.NOM_ESTANTE);
  :NEW.NOM_BOX_CLI  := UPPER(:NEW.NOM_BOX_CLI);
  :NEW.SIT_TIPO     := UPPER(:NEW.SIT_TIPO);
  :NEW.NOM_ASSUNTO  := UPPER(:NEW.NOM_ASSUNTO);
  :NEW.NOM_OBS      := UPPER(:NEW.NOM_OBS);
  :NEW.SIT_MODIFY   := UPPER(:NEW.SIT_MODIFY);
  :NEW.SIT_POSICAO  := UPPER(:NEW.SIT_POSICAO);
  :NEW.NOM_LOCALIZA := UPPER(:NEW.NOM_LOCALIZA);
  :NEW.NOM_FILME    := UPPER(:NEW.NOM_FILME);  
end TG_B_IU_DOCUMENTOS;

/

CREATE TABLE ARQUIVO_MORTO (
    COD_REF         NUMBER NOT NULL,
    NUM_PADRAO     NUMBER,
    NUM_BOX        NUMBER,
    NUM_ITEM       NUMBER,
    NUM_NUMERO     NUMBER,
    COD_DEPTO      NUMBER,
    NOM_SALA       VARCHAR2(4),
    NOM_ESTANTE    VARCHAR2(4),
    NOM_BOX_CLI    VARCHAR2(10),
    SIT_TIPO       CHAR(1),
    NOM_ASSUNTO    VARCHAR2(255),
    NOM_OBS        VARCHAR2(240),
    DAT_INICIO     DATE,
    DAT_TERMINO    DATE,
    NUM_TEMPORAL   NUMBER,
    NUM_ANOS       NUMBER,
    DAT_EXPURGO    VARCHAR2(6),
    COD_EMPRES     NUMBER,
    SIT_MODIFY     CHAR(1),
    NOM_RESP       VARCHAR2(20),
    DAR_EXPURGO    DATE,
    NOM_RESP_EMP   VARCHAR2(20),
    NOM_EXPURGO    VARCHAR2(255),
    COD_EMPRESA    NUMBER,
    SIT_POSICAO    CHAR(1),
    COD_CCUSTO     NUMBER,
    DAT_CADASTRO   DATE,
    NOM_LOCALIZA   VARCHAR2(30),
    NOM_FILME      VARCHAR2(10),
    COD_EMP_INT    NUMBER 
);

/

-- Create sequence 
create sequence SQ_ARQUIVO_MORTO
minvalue 1
maxvalue 9999999999999999999999999
start with 1
increment by 1
nocache;

/

-- Add/modify columns 
alter table ARQUIVO_MORTO modify DAT_EXPURGO date;

/

create or replace trigger TG_B_I_ARQUIVO_MORTO
  before insert on ARQUIVO_MORTO  
  for each row
declare
  -- local variables here
 nPROX NUMBER;
begin

 SELECT SQ_ARQUIVO_MORTO.NEXTVAL INTO nPROX
  FROM DUAL;
  
 :NEW.COD_REF := nPROX;   

end TG_B_I_ARQUIVO_MORTO;

/

create or replace trigger TG_B_IU_ARQUIVO_MORTO
  before INSERT OR UPDATE on ARQUIVO_MORTO  
  for each row
declare
  -- local variables here
begin
  :NEW.NOM_SALA     := UPPER(:NEW.NOM_SALA);
  :NEW.NOM_ESTANTE  := UPPER(:NEW.NOM_ESTANTE);
  :NEW.NOM_BOX_CLI  := UPPER(:NEW.NOM_BOX_CLI);
  :NEW.SIT_TIPO     := UPPER(:NEW.SIT_TIPO);
  :NEW.NOM_ASSUNTO  := UPPER(:NEW.NOM_ASSUNTO);
  :NEW.NOM_OBS      := UPPER(:NEW.NOM_OBS);
  :NEW.SIT_MODIFY   := UPPER(:NEW.SIT_MODIFY);
  :NEW.NOM_RESP     := UPPER(:NEW.SIT_POSICAO);
  :NEW.NOM_LOCALIZA := UPPER(:NEW.NOM_LOCALIZA);
  :NEW.NOM_RESP_EMP := UPPER(:NEW.NOM_RESP_EMP);
  :NEW.NOM_EXPURGO  := UPPER(:NEW.NOM_EXPURGO);
  :NEW.NOM_RESP     := UPPER(:NEW.NOM_RESP);
  :NEW.SIT_POSICAO  := UPPER(:NEW.SIT_POSICAO);
  :NEW.NOM_LOCALIZA := UPPER(:NEW.NOM_LOCALIZA);
  :NEW.NOM_FILME    := UPPER(:NEW.NOM_FILME);
    
end TG_B_IU_ARQUIVO_MORTO;

/

-- Create/Recreate primary, unique and foreign key constraints 
alter table ARQUIVO_MORTO
  add constraint PK_ARQUIVO_MORTO primary key (COD_REF);
alter table ARQUIVO_MORTO
  add constraint FK_ARQUIVO_MORTO#DEPARTAMENTO foreign key (COD_DEPTO)
  references departamento (COD_DEPTO);
alter table ARQUIVO_MORTO
  add constraint FK_ARQUIVO_MORTO#EMPRESTIMO foreign key (COD_EMPRES)
  references emprestimos (COD_EMPRES);
alter table ARQUIVO_MORTO
  add constraint FK_ARQUIVO_MORTO#EMPRESA foreign key (COD_EMPRESA)
  references empresa (COD_EMPRESA);
alter table ARQUIVO_MORTO
  add constraint FK_ARQUIVO_MORTO#CENTRO_CUSTO foreign key (COD_CCUSTO)
  references centro_custo (COD_CCUSTO);
alter table ARQUIVO_MORTO
  add constraint FK_ARQUIVO_MORTO#EMPRESA_INT foreign key (COD_EMP_INT)
  references empresa_INT (COD_EMP_INT);
  
/

  
-- Add/modify columns 
alter table DEPARTAMENTO add SQ_DEPTO number;
-- Create/Recreate primary, unique and foreign key constraints 
alter table DEPARTAMENTO
  drop constraint PK_DEPARTAMENTO cascade;
alter table DEPARTAMENTO
  add constraint PK_DEPARTAMENTO primary key (SQ_DEPTO)
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
  
/

create or replace trigger TG_B_I_DEPARTAMENTO
  before insert on DEPARTAMENTO  
  for each row
declare
  -- local variables here
 nPROX NUMBER;
begin

 SELECT SQ_DEPTO.NEXTVAL INTO nPROX
  FROM DUAL;
  
 :NEW.SQ_DEPTO := nPROX;   

end TG_B_I_DEPARTAMENTO;

/

-- Add/modify columns 
alter table ARQUIVO_MORTO rename column COD_DEPTO to SQ_DEPTO;
-- Create/Recreate primary, unique and foreign key constraints 
alter table ARQUIVO_MORTO
  add constraint FK_ARQUIVO_MORTO#DEPARTAMENTO foreign key (SQ_DEPTO)
  references departamento (SQ_DEPTO);

/

-- Add/modify columns 
alter table CENTRO_CUSTO rename column COD_DEPTO to SQ_DEPTO;
-- Create/Recreate primary, unique and foreign key constraints 
alter table CENTRO_CUSTO
  add constraint FK_CENTRO_CUSTO#DEPARTAMENTO foreign key (SQ_DEPTO)
  references departamento (SQ_DEPTO);

/

-- Add/modify columns 
alter table DEPART_COLIGS rename column COD_DEPTO to SQ_DEPTO;
-- Create/Recreate primary, unique and foreign key constraints 
alter table DEPART_COLIGS
  drop constraint PK_DEPART_COLIGS cascade;
alter table DEPART_COLIGS
  add constraint PK_DEPART_COLIGS primary key (COD_EMPRESA, SQ_DEPTO, COD_DEP_COL)
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
alter table DEPART_COLIGS
  add constraint FK_DEPART_COLIGS#DEPARTAMENTO foreign key (SQ_DEPTO)
  references departamento (SQ_DEPTO);
alter table DEPART_COLIGS
  add constraint FK_DEPART_COLIGS#EMPRESA foreign key (COD_EMPRESA)
  references empresa (COD_EMPRESA);

/

-- Add/modify columns 
alter table DOCUMENTOS rename column COD_DEPTO to SQ_DEPTO;
-- Create/Recreate primary, unique and foreign key constraints 
alter table DOCUMENTOS
  add constraint FK_DOCUMENTO#DEPARTAMENTO foreign key (SQ_DEPTO)
  references departamento (SQ_DEPTO);

/

-- Add/modify columns 
alter table EMPRESTIMOS rename column COD_DEPTO to sq_DEPTO;
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMPRESTIMOS
  add constraint FK_EMPRESTIMOS foreign key (SQ_DEPTO)
  references departamento (SQ_DEPTO);

/

-- Add/modify columns 
alter table USU_WEBDEPTO rename column COD_DEPTO to SQ_DEPTO;
-- Create/Recreate primary, unique and foreign key constraints 
alter table USU_WEBDEPTO
  add constraint FK_USU_WEBDEPTO#DEPARTAMENTO foreign key (SQ_DEPTO)
  references departamento (SQ_DEPTO);
  
/

-- Drop columns 
alter table EMPRESTIMOS drop column NUM_PADRAO;

/

  

  

  
  
  
  


  
  

