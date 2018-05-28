--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.1
-- Dumped by pg_dump version 9.5.5

-- Started on 2018-05-28 16:06:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE bioacademy;
--
-- TOC entry 2389 (class 1262 OID 460816)
-- Name: bioacademy; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bioacademy WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';


ALTER DATABASE bioacademy OWNER TO postgres;

\connect bioacademy

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2392 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 230 (class 1255 OID 469258)
-- Name: generateidclasse(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION generateidclasse() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
 DECLARE
 maVar varchar(3);
 

BEGIN

  maVar = nextval('seqclass');
  NEW.idclasse = trim(NEW.idclasse)||maVar;
  
     RETURN NEW ;
END ;
 $$;


ALTER FUNCTION public.generateidclasse() OWNER TO postgres;

--
-- TOC entry 231 (class 1255 OID 469249)
-- Name: generateidmatiere(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION generateidmatiere() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
 DECLARE
 maVar varchar(3);
 

BEGIN

  maVar = nextval('seqmat');
  maVar = lpad(maVar, 3, '0');
  NEW.idmatiere = trim(NEW.idmatiere)||maVar;
  
     RETURN NEW ;
END ;
 $$;


ALTER FUNCTION public.generateidmatiere() OWNER TO postgres;

--
-- TOC entry 229 (class 1255 OID 477378)
-- Name: updateannee(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION updateannee() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
 DECLARE 

BEGIN

  UPDATE annee_academique set encour =false;
  
     RETURN NEW ;
END ;
 $$;


ALTER FUNCTION public.updateannee() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 206 (class 1259 OID 562754)
-- Name: administrateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE administrateur (
    matricule character varying NOT NULL,
    nom character varying,
    pwd character varying
);


ALTER TABLE administrateur OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 460862)
-- Name: annee_academique; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE annee_academique (
    idannee character varying NOT NULL,
    objectif character varying,
    encour boolean
);


ALTER TABLE annee_academique OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 469178)
-- Name: classe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE classe (
    idclasse character varying NOT NULL,
    libelle character varying,
    iddepartement character varying
);


ALTER TABLE classe OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 460909)
-- Name: cours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cours (
    idcours integer NOT NULL,
    idannee character varying,
    heure_d character varying,
    heure_f character varying,
    idformation character varying,
    date_j date,
    idclasse character varying,
    id_matiere character varying,
    iddepartement character varying,
    annuler boolean DEFAULT false,
    matricule character varying
);


ALTER TABLE cours OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 460907)
-- Name: cours_idcours_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cours_idcours_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cours_idcours_seq OWNER TO postgres;

--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 176
-- Name: cours_idcours_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cours_idcours_seq OWNED BY cours.idcours;


--
-- TOC entry 190 (class 1259 OID 560730)
-- Name: cycles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cycles (
    idcycle character varying(1) NOT NULL,
    libelle character varying(10),
    annuler boolean DEFAULT false
);


ALTER TABLE cycles OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 469186)
-- Name: departement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE departement (
    iddepartement character varying NOT NULL,
    libelle character varying
);


ALTER TABLE departement OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 560753)
-- Name: departement_geographique; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE departement_geographique (
    codedepartementgeographique character varying(50) NOT NULL,
    idregion character varying,
    libelledepartementgeographiquelangue1 character varying,
    libelledepartementgeographiquelangue2 character varying
);


ALTER TABLE departement_geographique OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 560761)
-- Name: diplomes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE diplomes (
    iddiplome character varying(5) NOT NULL,
    libellefr character varying(130) DEFAULT NULL::character varying,
    libelleen character varying(130) DEFAULT NULL::character varying,
    annuler boolean DEFAULT false
);


ALTER TABLE diplomes OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 562760)
-- Name: ecole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ecole (
    codeecole character varying NOT NULL,
    libelefr character varying,
    libeleen character varying,
    codemat character varying,
    dateouverture date,
    datefermeture date,
    anneeencours character varying,
    annuler boolean
);


ALTER TABLE ecole OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 560853)
-- Name: empreinte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE empreinte (
    num_doigt integer NOT NULL,
    libelle_doigt character varying(100)
);


ALTER TABLE empreinte OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 469194)
-- Name: enseignant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE enseignant (
    matricule character varying NOT NULL,
    nom character varying,
    actif boolean DEFAULT true,
    nfinger1 integer,
    finger1 character varying,
    nfinger2 integer,
    finger2 character varying,
    cni character varying,
    telephone character varying,
    mail character varying,
    photo character varying,
    pwd character varying
);


ALTER TABLE enseignant OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 460941)
-- Name: enseigne; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE enseigne (
    heure_d character varying,
    heure_f character varying,
    commentaire character varying,
    date_j date,
    matricule character varying NOT NULL,
    idcours integer NOT NULL
);


ALTER TABLE enseigne OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 460853)
-- Name: etudiant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE etudiant (
    matricule character varying NOT NULL,
    nom character varying,
    datenaiss character varying,
    lieunaiss character varying,
    cni character varying,
    mail character varying,
    nfinger1 integer,
    finger1 character varying,
    nfinger2 integer,
    finger2 character varying,
    annuler boolean DEFAULT false,
    photo character varying,
    telephone character varying DEFAULT 0,
    pwd character varying
);


ALTER TABLE etudiant OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 562766)
-- Name: filiere; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE filiere (
    codefilere character varying NOT NULL,
    libelefilierefr character varying,
    libelefiliereen character varying,
    cycles character varying(1),
    typeformation character varying,
    ecole character varying,
    montant numeric,
    annuler boolean,
    comptebancaire character varying
);


ALTER TABLE filiere OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 560767)
-- Name: handicaps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE handicaps (
    idhandicap character varying(5) NOT NULL,
    libellefr character varying(30) DEFAULT NULL::character varying,
    libelleen character varying(30) DEFAULT NULL::character varying,
    annuler boolean DEFAULT false
);


ALTER TABLE handicaps OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 510131)
-- Name: inscription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE inscription (
    idinscription integer NOT NULL,
    idformation character varying,
    idclasse character varying,
    idannee character varying,
    matricule character varying,
    montant integer,
    paye boolean DEFAULT false,
    type_frais character varying
);


ALTER TABLE inscription OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 510129)
-- Name: inscription_idinscription_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE inscription_idinscription_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inscription_idinscription_seq OWNER TO postgres;

--
-- TOC entry 2394 (class 0 OID 0)
-- Dependencies: 186
-- Name: inscription_idinscription_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE inscription_idinscription_seq OWNED BY inscription.idinscription;


--
-- TOC entry 196 (class 1259 OID 560773)
-- Name: langues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE langues (
    idlangue character varying(5) NOT NULL,
    libellefr character varying(100) DEFAULT NULL::character varying,
    libelleen character varying(100) DEFAULT NULL::character varying,
    annuler boolean DEFAULT false
);


ALTER TABLE langues OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 560779)
-- Name: loisirs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE loisirs (
    idloisir character varying(5) NOT NULL,
    libellefr character varying(50) DEFAULT NULL::character varying,
    libelleen character varying(50) DEFAULT NULL::character varying,
    annuler boolean DEFAULT false
);


ALTER TABLE loisirs OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 469217)
-- Name: matiere; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE matiere (
    idmatiere character varying NOT NULL,
    iddepartement character varying,
    libelle character varying,
    annuler boolean DEFAULT false
);


ALTER TABLE matiere OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 560785)
-- Name: matieres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE matieres (
    idmatiere character varying(5) NOT NULL,
    libellefr character varying(50) DEFAULT NULL::character varying,
    libelleen character varying(50) DEFAULT NULL::character varying,
    annuler boolean DEFAULT false
);


ALTER TABLE matieres OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 560791)
-- Name: mentions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mentions (
    idmention character varying(3) NOT NULL,
    libellefr character varying(10) DEFAULT NULL::character varying,
    libelleen character varying(10) DEFAULT NULL::character varying,
    annuler boolean DEFAULT false
);


ALTER TABLE mentions OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 562772)
-- Name: message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE message (
    idmessage character varying NOT NULL,
    idetudiant character varying,
    auteur character varying,
    datereception date,
    datelecture date,
    heurereception time with time zone,
    heurelecture time with time zone,
    contenu character varying,
    messagelu boolean,
    libelle character varying
);


ALTER TABLE message OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 562778)
-- Name: message_preins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE message_preins (
    idmessage character varying NOT NULL,
    auteur character varying,
    datereception date,
    datelecture date,
    heurelecture time without time zone,
    contenu character varying,
    messagelu boolean,
    libelle character varying,
    idpreins bigint
);


ALTER TABLE message_preins OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 560797)
-- Name: niveau; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE niveau (
    code_niveau character varying(2) NOT NULL,
    libelle_niveau character varying(50) NOT NULL,
    code_cycle character varying(2) NOT NULL
);


ALTER TABLE niveau OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 560740)
-- Name: pays; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pays (
    codepays character varying(3) NOT NULL,
    libelle_en character varying(45) NOT NULL,
    libelle_fr character varying(45) NOT NULL
);


ALTER TABLE pays OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 562784)
-- Name: piece_dossier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE piece_dossier (
    idpiece integer NOT NULL,
    libele character varying,
    codefiliere character varying
);


ALTER TABLE piece_dossier OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 562790)
-- Name: piece_dossier_idpiece_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE piece_dossier_idpiece_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE piece_dossier_idpiece_seq OWNER TO postgres;

--
-- TOC entry 2395 (class 0 OID 0)
-- Dependencies: 212
-- Name: piece_dossier_idpiece_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE piece_dossier_idpiece_seq OWNED BY piece_dossier.idpiece;


--
-- TOC entry 213 (class 1259 OID 562792)
-- Name: preins_diplome; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE preins_diplome (
    iddiplome character varying NOT NULL,
    idpreins bigint NOT NULL,
    anneobtention character varying,
    etabobtention character varying,
    annuler boolean
);


ALTER TABLE preins_diplome OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 562798)
-- Name: preins_matiere; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE preins_matiere (
    idmatiere character varying(5) NOT NULL,
    idpreins bigint NOT NULL,
    note_ou_grade character varying,
    annuler boolean
);


ALTER TABLE preins_matiere OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 562804)
-- Name: preinscription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE preinscription (
    idpreins bigint NOT NULL,
    ecole character varying,
    rentreeacademique character varying,
    sexe character varying(1),
    nom character varying,
    datenaiss date,
    anneeacademique character varying,
    lieunaiss character varying,
    villeresid character varying,
    paysnationalite character varying(3),
    region character varying,
    departementgeographique character varying(50),
    lang1 character varying(5),
    lang2 character varying(5),
    numtel character varying,
    email character varying,
    situationmatrimoniale character varying,
    typeformation character varying(1),
    choixformation1 character varying,
    choixformation2 character varying,
    choixformation3 character varying,
    diplomeadmission character varying(5),
    typebacc character varying(3),
    mention character varying(3),
    anneeobtentiondipl character varying,
    paysobtentiondipl character varying(3),
    etablissementdipl character varying,
    descriptionactiviteprof character varying,
    handicap boolean,
    typehandicap character varying(5),
    loisir1 character varying(5),
    loisir2 character varying(5),
    activitesportive boolean,
    sport1 character varying(5),
    sport2 character varying(5),
    nompersonneacontacter character varying,
    telpersonneacontacter character varying,
    nomparent1 character varying,
    telparent1 character varying,
    nomparent2 character varying,
    telparent2 character varying,
    datepreins date,
    annuler boolean,
    etatpreins character varying(1),
    paye boolean,
    datepaiement date,
    rendezvouspaiement character varying,
    cycles character varying,
    typepaiement character varying,
    rendezvousdepotdossier character varying,
    selectionner boolean,
    generer boolean,
    etapeaccorde character varying,
    matricule character varying,
    centredexamen character varying,
    numcni character varying,
    emailpersonneacontacter character varying,
    login character varying,
    pwd character varying,
    taf boolean,
    activitesportivecom boolean,
    prenom character varying,
    adresse character varying,
    activiteprofessionnelle character varying
);


ALTER TABLE preinscription OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 562810)
-- Name: preinscription_idpreins_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE preinscription_idpreins_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE preinscription_idpreins_seq OWNER TO postgres;

--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 216
-- Name: preinscription_idpreins_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE preinscription_idpreins_seq OWNED BY preinscription.idpreins;


--
-- TOC entry 192 (class 1259 OID 560745)
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE region (
    coderegion character varying NOT NULL,
    codepays character varying(3) NOT NULL,
    libelleregionlangue1 character varying,
    libelleregionlangue2 character varying
);


ALTER TABLE region OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 469256)
-- Name: seqclass; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seqclass
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2500
    CACHE 1;


ALTER TABLE seqclass OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 469247)
-- Name: seqmat; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seqmat
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999
    CACHE 1
    CYCLE;


ALTER TABLE seqmat OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 560800)
-- Name: sports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sports (
    idsport character varying(5) NOT NULL,
    libellefr character varying(100) DEFAULT NULL::character varying,
    libelleen character varying(100) DEFAULT NULL::character varying,
    annuler boolean DEFAULT true
);


ALTER TABLE sports OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 460959)
-- Name: suivre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE suivre (
    matricule character varying NOT NULL,
    idcours integer NOT NULL,
    heure_d character varying,
    heure_f character varying,
    commentaire character varying,
    date_j date
);


ALTER TABLE suivre OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 560858)
-- Name: tableenrol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tableenrol (
    matricule character varying(50) NOT NULL,
    nom character varying(250),
    prenom character varying(250),
    datenaiss character varying(20),
    lieunaiss character varying(250),
    sexe character varying(1),
    tel character varying(150),
    email character varying(250),
    cni character varying(50),
    niveauetud character varying(5),
    handicap character varying(5),
    emploi character varying(5),
    idpays character varying(20),
    idregion character varying(25),
    langue character varying(2),
    clavier character varying(2),
    etabli character varying(10),
    enrol boolean,
    iduniversite integer,
    idetablissement integer,
    iddepartement integer,
    signatureetud text,
    numdoigtgauche integer,
    isodg text,
    rawdg text,
    numdoigtdroit integer,
    isodd text,
    rawdd text,
    statust1 boolean,
    statust2 boolean,
    tof_etud text,
    tof_empg text,
    tof_empd text,
    traite character varying(2),
    date_enrol date
);


ALTER TABLE tableenrol OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 550515)
-- Name: tabpers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tabpers (
    nom character varying,
    prenom character varying,
    descrip character varying,
    id integer NOT NULL
);


ALTER TABLE tabpers OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 550513)
-- Name: tabpers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tabpers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tabpers_id_seq OWNER TO postgres;

--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 188
-- Name: tabpers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tabpers_id_seq OWNED BY tabpers.id;


--
-- TOC entry 202 (class 1259 OID 560806)
-- Name: type_bacc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE type_bacc (
    idtypebacc character varying(3) NOT NULL,
    libellefr character varying(20) DEFAULT NULL::character varying,
    libelleen character varying(20) DEFAULT NULL::character varying,
    annuler boolean DEFAULT false
);


ALTER TABLE type_bacc OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 460870)
-- Name: type_formation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE type_formation (
    idformation character varying NOT NULL,
    libelle_fr character varying
);


ALTER TABLE type_formation OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 560812)
-- Name: type_paiement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE type_paiement (
    idtypepaiement character(5) NOT NULL,
    libelle character(40),
    annuler boolean DEFAULT false
);


ALTER TABLE type_paiement OWNER TO postgres;

--
-- TOC entry 2066 (class 2604 OID 460912)
-- Name: idcours; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cours ALTER COLUMN idcours SET DEFAULT nextval('cours_idcours_seq'::regclass);


--
-- TOC entry 2070 (class 2604 OID 510134)
-- Name: idinscription; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscription ALTER COLUMN idinscription SET DEFAULT nextval('inscription_idinscription_seq'::regclass);


--
-- TOC entry 2099 (class 2604 OID 562813)
-- Name: idpiece; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY piece_dossier ALTER COLUMN idpiece SET DEFAULT nextval('piece_dossier_idpiece_seq'::regclass);


--
-- TOC entry 2100 (class 2604 OID 562814)
-- Name: idpreins; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription ALTER COLUMN idpreins SET DEFAULT nextval('preinscription_idpreins_seq'::regclass);


--
-- TOC entry 2072 (class 2604 OID 550518)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tabpers ALTER COLUMN id SET DEFAULT nextval('tabpers_id_seq'::regclass);


--
-- TOC entry 2374 (class 0 OID 562754)
-- Dependencies: 206
-- Data for Name: administrateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO administrateur VALUES ('14IJS562', 'ben', 'ben10');


--
-- TOC entry 2342 (class 0 OID 460862)
-- Dependencies: 174
-- Data for Name: annee_academique; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO annee_academique VALUES ('2017/2018', '100% de ressite', true);
INSERT INTO annee_academique VALUES ('2019/2020', 'yuiyuiuyiy', false);
INSERT INTO annee_academique VALUES ('2018/2019', '100%', false);


--
-- TOC entry 2348 (class 0 OID 469178)
-- Dependencies: 180
-- Data for Name: classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO classe VALUES ('GI1', 'GENIE INFORMATIQUE 1', 'DEPGI');
INSERT INTO classe VALUES ('GI6', 'GENIE INFORMATIQUE 2', 'DEPGI');
INSERT INTO classe VALUES ('DEPOGA7', 'OGA L1', 'DEPOGA');
INSERT INTO classe VALUES ('OGA8', 'OGA L2', 'DEPOGA');


--
-- TOC entry 2345 (class 0 OID 460909)
-- Dependencies: 177
-- Data for Name: cours; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cours VALUES (5, '2017/2018', '06:00', '09:00', '1', '2017-11-12', 'GI1', 'DEPGI100', 'DEPGI', false, '13M12345');
INSERT INTO cours VALUES (4, '2017/2018', '06:00', '07:00', '1', '2017-11-12', 'GI1', 'DEPGI002', 'DEPGI', false, '13M12345');
INSERT INTO cours VALUES (7, '2017/2018', '06:00', '06:00', '1', '2017-11-12', 'GI1', 'DEPGI100', 'DEPGI', false, '123JET123');
INSERT INTO cours VALUES (8, '2017/2018', '06:00', '06:00', '1', '2017-11-12', 'GI1', 'DEPGI100', 'DEPGI', false, '123JET123');
INSERT INTO cours VALUES (9, '2017/2018', '06:00', '06:00', '1', '2017-11-12', 'GI1', 'DEPGI100', 'DEPGI', false, '123JET123');
INSERT INTO cours VALUES (10, '2017/2018', '06:00', '06:00', '1', '2017-11-12', 'GI1', 'DEPGI100', 'DEPGI', false, '123JET123');
INSERT INTO cours VALUES (6, '2017/2018', '10:00', '11:00', '1', '2017-11-13', 'GI1', 'DEPGI100', 'DEPGI', false, '123JET123');
INSERT INTO cours VALUES (11, '2017/2018', '12:00', '13:00', '1', '2017-11-13', 'GI1', 'DEPGI002', 'DEPGI', false, '123JET123');
INSERT INTO cours VALUES (12, '2017/2018', '09:00', '10:00', '1', '2017-11-17', 'DEPOGA7', 'DEPOGA039', 'DEPOGA', false, '123JET123');
INSERT INTO cours VALUES (13, '2017/2018', '09:00', '10:00', '2', '2017-11-17', 'DEPOGA7', 'DEPOGA039', 'DEPOGA', false, '123JET123');
INSERT INTO cours VALUES (14, '2017/2018', '09:00', '10:00', '2', '2017-11-17', 'DEPOGA7', 'DEPOGA2041', 'DEPOGA', false, '123JET123');
INSERT INTO cours VALUES (15, '2017/2018', '06:00', '06:00', '1', '2017-11-20', 'GI1', 'DEPGI002', 'DEPGI', false, '123JET123');
INSERT INTO cours VALUES (16, '2017/2018', '06:00', '06:00', '1', '2017-11-20', 'GI1', 'DEPGI002', 'DEPGI', false, '123JET123');
INSERT INTO cours VALUES (17, '2017/2018', '06:00', '06:00', '2', '2017-11-20', 'GI1', 'DEPGI002', 'DEPGI', false, '123JET123');
INSERT INTO cours VALUES (18, '2017/2018', '06:00', '06:00', '2', '2017-11-20', 'DEPOGA7', 'DEPOGA040', 'DEPOGA', false, '123JET123');
INSERT INTO cours VALUES (19, '2017/2018', '06:00', '06:00', '1', '2017-11-30', 'GI1', 'DEPGI100', 'DEPGI', false, '123JET123');
INSERT INTO cours VALUES (20, '2017/2018', '09:00', '10:00', '1', '2017-11-30', 'GI1', 'DEPFE036', 'DEPGI', false, '123JET123');
INSERT INTO cours VALUES (22, '2017/2018', '09:00', '11:00', '1', '2018-04-16', 'GI1', 'DEPGI100', 'DEPGI', false, '123JET123');
INSERT INTO cours VALUES (21, '2017/2018', '09:00', '11:00', '1', '2018-04-16', 'GI1', 'DEPGI100', 'DEPGI', false, '123JET123');
INSERT INTO cours VALUES (23, '2017/2018', '13:00', '15:00', '1', '2018-04-16', 'GI1', 'DEPFE036', 'DEPGI', false, '123JET123');
INSERT INTO cours VALUES (24, '2017/2018', '06:00', '06:00', '1', '2018-04-17', 'GI1', 'DEPGI002', 'DEPGI', false, '123JET123');


--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 176
-- Name: cours_idcours_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cours_idcours_seq', 24, true);


--
-- TOC entry 2358 (class 0 OID 560730)
-- Dependencies: 190
-- Data for Name: cycles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cycles VALUES ('L', 'LICENCE', false);
INSERT INTO cycles VALUES ('M', 'MASTER', false);
INSERT INTO cycles VALUES ('D', 'DOCTORAT', false);
INSERT INTO cycles VALUES ('B', 'BTS', false);
INSERT INTO cycles VALUES ('H', 'HND', false);
INSERT INTO cycles VALUES ('S', 'DSEP', false);
INSERT INTO cycles VALUES ('C', 'CAPACITE', false);


--
-- TOC entry 2349 (class 0 OID 469186)
-- Dependencies: 181
-- Data for Name: departement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO departement VALUES ('DEPGI', 'GENIE INFORMATIQUE
');
INSERT INTO departement VALUES ('DEPOGA', 'ORGANISATION ET GESTION ADMINISTRATIVE');


--
-- TOC entry 2361 (class 0 OID 560753)
-- Dependencies: 193
-- Data for Name: departement_geographique; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO departement_geographique VALUES ('DJRM', 'AD', 'Djerem', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('FARD', 'AD', 'Faro-et-Deo', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MYBN', 'AD', 'Mayo-Banyo', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MBER', 'AD', 'Mbere', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('VINA', 'AD', 'Vina', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('HTSN', 'CE', 'Haute-Sanaga', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('LEKI', 'CE', 'Lekie', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MBIN', 'CE', 'Mbam-et-Inoubou', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MBKM', 'CE', 'Mbam-et-Kim', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MFAF', 'CE', 'Mefou-et-Afamba', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MFAK', 'CE', 'Mefou-et-Akono', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MFND', 'CE', 'Mfoundi', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('NYKL', 'CE', 'Nyong-et-Kelle', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('NYMF', 'CE', 'Nyong-et-Mfoumou', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('NYSO', 'CE', 'Nyong-et-Soo', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('BBNG', 'ES', 'Boumba-et-Ngoko', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('HANY', 'ES', 'Haut-Nyong', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('KADE', 'ES', 'Kadey', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('LMDJ', 'ES', 'Lom-et-Djerem', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('DMRE', 'EN', 'Diamare', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('LOCH', 'EN', 'Logone-et-Chari', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MYDN', 'EN', 'Mayo-Danay', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MYKN', 'EN', 'Mayo-Kani', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MASV', 'EN', 'Mayo-Sava', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MYTN', 'EN', 'Mayo-Tsanaga', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MOUN', 'LT', 'Moungo', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('NKAM', 'LT', 'Nkam', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('SNMR', 'LT', 'Sanaga-Maritime', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('WOUR', 'LT', 'Wouri ', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('BENO', 'NO', 'Benoue', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('FARO', 'NO', 'Faro', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MYLT', 'NO', 'Mayo-Louti', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MYRY', 'NO', 'Mayo-Rey', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('BOYO', 'NW', 'Boyo', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('BUI', 'NW', 'Bui', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('DGMT', 'NW', 'Donga-Mantung', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MNCH', 'NW', 'Menchum', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MEZM', 'NW', 'Mezam', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MOMO', 'NW', 'Momo', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('NGKT', 'NW', 'Ngo-Ketunjia', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('BTOS', 'OU', 'Bamboutos', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('HNKM', 'OU', 'Haut-Nkam', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('HAPT', 'OU', 'Hauts-Plateaux', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('KNKH', 'OU', 'Koung-Khi ', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MENO', 'OU', 'Menoua', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MIFI', 'OU', 'Mifi', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('NDE', 'OU', 'Nde', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('NOUN', 'OU', 'Noun', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('DJLB', 'SU', 'Dja-et-Lobo', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MVLA', 'SU', 'Mvila', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('OCEA', 'SU', 'Ocean', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('VLNT', 'SU', 'Vallee-du-Ntem', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('KPMG', 'SW', 'Koupe-Manengouba', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('LEBL', 'SW', 'Lebialem', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MANY', 'SW', 'Manyu', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('MEME', 'SW', 'Meme', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('NDIA', 'SW', 'Ndian', 'NoTranslation');
INSERT INTO departement_geographique VALUES ('FAKO', 'SW', 'Fako', 'NoTranslation');


--
-- TOC entry 2362 (class 0 OID 560761)
-- Dependencies: 194
-- Data for Name: diplomes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO diplomes VALUES ('bacc', 'Baccalauréat', 'Baccalauréat', false);
INSERT INTO diplomes VALUES ('gce', 'GCE Advanced Level', 'GCE Advanced Level', false);
INSERT INTO diplomes VALUES ('dut', 'DUT', 'DUT', false);
INSERT INTO diplomes VALUES ('bts', 'BTS', 'BTS', false);
INSERT INTO diplomes VALUES ('hnd', 'HND', 'HND', false);
INSERT INTO diplomes VALUES ('dsep', 'DSEP', 'DSEP', false);
INSERT INTO diplomes VALUES ('lic', 'Licence', 'Licence', false);
INSERT INTO diplomes VALUES ('mas', 'Master', 'Master', false);
INSERT INTO diplomes VALUES ('bt', 'BT', 'BT', false);
INSERT INTO diplomes VALUES ('becap', 'BEPC / CAP', 'BEPC / CAP', false);
INSERT INTO diplomes VALUES ('prob', 'Probatoire', 'Probatoire', false);
INSERT INTO diplomes VALUES ('capa', 'Capacité', 'Capacité', false);
INSERT INTO diplomes VALUES ('*', 'Autres', 'Autres', false);


--
-- TOC entry 2375 (class 0 OID 562760)
-- Dependencies: 207
-- Data for Name: ecole; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ecole VALUES ('issam', 'INSTITUT SUPERIEUR DES SCIENCES, ARTS ET METIERS', 'INSTITUT SUPERIEUR DES SCIENCES, ARTS ET METIERS', 'S', NULL, NULL, '2018/2019', false);
INSERT INTO ecole VALUES ('SCHL1', 'Ecole1', 'School1', 'code1', '2001-05-02', '2018-04-21', '2018/2019', false);


--
-- TOC entry 2372 (class 0 OID 560853)
-- Dependencies: 204
-- Data for Name: empreinte; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO empreinte VALUES (1, 'Auriculaire Main gauche');
INSERT INTO empreinte VALUES (2, 'Annulaire Main Gauche');
INSERT INTO empreinte VALUES (3, 'Majeur Main Gauche');
INSERT INTO empreinte VALUES (4, 'Index Main Gauche');
INSERT INTO empreinte VALUES (5, 'Pouce Main Gauche');
INSERT INTO empreinte VALUES (6, 'Pouce Main Droite');
INSERT INTO empreinte VALUES (7, 'Index Main Droite');
INSERT INTO empreinte VALUES (8, 'Majeur Main Droite');
INSERT INTO empreinte VALUES (9, 'Annulaire Main Droite');
INSERT INTO empreinte VALUES (10, 'Auriculaire Main Droite');


--
-- TOC entry 2350 (class 0 OID 469194)
-- Dependencies: 182
-- Data for Name: enseignant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enseignant VALUES ('123JET123', 'MEDJIGNIA', true, 5, 'Rk1SACAyMAAAAAFKAAABAAGQAMUAxQEAAABXMoAsAA+MQ4BfACSYXYByACmYXUCFACmYXYBPACuQ
UIC2AC2UXUAeADCQSoBDADKUSoDSADuQXUB0AEWgXYCVAEmkXUAlAEyYXUBfAFMgXUA3AF+gXUBR
AGGoXYALAH00UIBtAJQoXUCjAKWkV4BtAKqsXYBKAKy0XUAiALE8XYCaALgsV0APALxAXUCQAL+o
XYA1AMM0XYB3AMOwXUB7AMgoXYBaANEwXYDZANsoXUD1AOKkV4B+AO0wXUBBAPI8XYAgAPVMXUAw
APxEXYCjAQMkXYB3AQVIUIA8ARhUXYC9ARqcXYCHAR94XYDbAR8sXYCVASaQXYBfAS1gXYCCATSA
XYCVATgcXYBtAUJwV0A3AURgXUC9AU6gXUC2AVwkXUDXAWocSkBDAYFwXQAA
', 6, 'Rk1SACAyMAAAAAD2AAABAAGQAMUAxQEAAABXJEDbAA/ESkDEABZIV4BRAB/MXUByACZMXYBYAD5M
XUAgAEzQXYCOAExMXYDEAExAXYA+AGFQXYCXAHRESkAwAH3UXUCcAIt0XYCjAJAgXYDgAJ4kXYBF
AKJYXYAuAKXcXUCAAKr4XYCoAK4UXYDnALMcXUA8ALpcXUBkAMpkXUC4ANYQXUBRAN/oXUAZAOvg
XYBKAQ5kXYCJAQ74XYBkASjoXYCAASj0XUCXATF4XUAiATbkXYC2AVCAXUDEAVkEV0AnAWzgV4CO
AWz8XUCvAXN8UIBfAYFkVwAA
', '10796995012', '695833429', 'mendjijet@gmail.com', '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB
AQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEB
AQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCAECAQIDASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD8dIkM
EyiRg6jO5wWGzazEMuSeeOfmOCMMe7d7pEtu0W+Te4UjCHGCTnJbI5ycEdeCpzjcTw1wkLzOiMXR
mDRSkLkYZ9uVDEBgOCMspyehYGuw0+0uEt1aCV2YqGAcgqwUyBl2qFIYYJIO4NkDGeT+ETUKMZ1a
ddyhT5OanKUU5x9o40+bllZbrSSfVppSlf8AoShVdTnoVsGr/ZfI38T1s5Wa2jqm7ttJ3jpuTSRz
CSOzBh2ruQlsRMcsGDLsABIUA4YgFhgEZauM1e4kt7eVJGcyEfIIgADln+cnGF+b7pGRnJ3KdzV1
qQXWJnliALBRtAZUZcOOkhPAwA3qMjAIy2XNDp00bpMELOoUDzV3QSJI3zIoJV0baR84JK8ZV0Ln
bAV6dqk41qcazbfPUUmnHnkow0Xs27XfuuzfLq4QknzVsHiOR03RrOlUvBRStBR5/edlfWy3d3o1
dttvz0Xl9MmC7xtgNuUhyzAsMSDa4JI3NkHOMZBILVXEsjn55IcSbVDKrIOsg2/J6tgBhnDY4UFi
ege0tYy32cSCXgKGDBGUE9SGU/Nu5JXpuycgZgNkzEruMYZRLh0Dgt+8BG9T91WHBALcsSSVYN63
+sCp0vq85Rqtyg1VU4zi3d+4oqTai+qT5k7PmVrHm/6vSi3KnNwV21eE25p3V7px10s21bezbTu2
2tlZIma4mV3GNrYZZCpk4YEhtwwCrZycIoJBkY30a4tWPkSQsGCg7mYkoWcKFVmySeSFUFN7L/Gz
mr9npck0CLdRMsYWPBCiFiUYAsGwQcbfmyA7Iy4cgknci0a2ih8x42LH/UsEzlUZiqhwQVIIyUbo
zDOVJrqo42FSFSdCTnLm1gqU3Ju3M4ylZcyTd1rLRzcpWtI5KuXVaajGtBU1aTdR1VG0NE1aPM1e
0bXXMrSsnabMKFDcToV+ZAQGjSMiQks4b5SD94qAzAnaSOCQzVMNK0rUJCv2WUPsGySV44lMitIw
V93AZRkAkhXYMnmK4UVuwSywysxsRJhACUjcuDvJw2EwAfvHLKACNxbGK1ZI0mUSqJEJVSYyu0GQ
MRudRvB4AOVLZ5JYgM7VLFVnaPJJNR5nOXuRai5c7u/cuuWzi/Jczd78kqGD5XetdPlcYtSkuZSa
etuazu/iSd7LmacmeaS+HbyMO9ksccsLMsqOEdSYy7bQpG9wQNy7Cc4+6xKvSnS7v7Ik5mjYzFjI
oBUiVWY7jubdkqeMsCeNw5JrtDOEkZWTEYIVGkGQz7sFw5IYKoVWBDFQrDJJxV+Ozs5ULiUeS3Lw
oyFA+MSeV8pblgSBwABwApwd6U4qnJxqRhKSUZT3dRxTas7y5VrLzvd68zic6jGbmoQclSceRRi7
RUlNSbTaburSVr6OerS14Sz0iUHz7e6ImIOy3dQDOYs7ljIV18zALeU4JK42nC1ja74G8N+Jbd31
vRB9vBbbqNrFHFdxsisqJPKFbcq5UqHBVDkbcKGr07+ztORRIi3LqCGDfMwLq5QNjCBNu3lgykZY
huSQxL+1SWRBarGzqqyfapWZZAMhSImBVssS2Nytksc43UvrNGth6mGxVL21K0XKFWMeWo+Wzmml
eMrpvni1PSNtYtuVhVzRl7kozVpxvJyupSstVa/ZNuPd2fM/hrxd8FtTsmuX06A6nahixiSIi+ij
ZyqP9nKgSLtbBkgclcOWRAQtfPeq+Cry2BXZOGQyK4khdcFThslk3KQoJIORn7pGDn9aXuo7kSLN
blUjK8WkYEnlAMGKGTjaeGOcrjJZQAzjifE/g7w7rkfmzWbu7KwjuoJ4YsiTzFCzRpA3zJhS3PTf
wXLMfl8Xw/KlP2uV4imoys1h69Rtz96UeSnNwumuiqNy19+pdK/NPK6NT2riq1OomlZ017OXr+8c
lezfKrrVKLXX8b/Efw00rVftBntfs9yVQJdwhUlVtpGclSs6HGXJB29mGCK+d/EPw91zw9JPIYXv
7SIE+dDGxljUEZ86EKWGAwJZDt2sOQd1fsX4j+DM1unnWUdvqUeJGeOJFS48sCQhlRUBlK7MlQSQ
+GC4JJ8N1f4YyyLMbdGV3SNTG6fKvL7y/DOh2YY7hwc5IYtWmX8WZrkTVDHOU6SaXsMT0UWotUai
bso6JcrlBJuVmpafPYvKK1JrmpSpJpuMuX3Zq89mnZtNardJxTd2kfmn4I0qy1jxHbWd+dluyXDs
Tx88ccsiKc44OxgQeSDtOcHG9e6aItK8Y65bwr5EMEGmRsiAiJby/jhXjBA3QxdTgZb5QWINfRni
D4Qy2F3/AGrYWTadfI4ZJUQm3uX2zxlDGijlhvJKgvyGBcMwLvgv4a0+bVL/AOG3jrT45I/Fcd7M
PMJRJZtPa3NtFDNsAEmwzXSKrKw2HLB1Ar6TE8WYWpQxObUJ1alPDUcJOrl6lFVlRpYmpWxlWlFy
5ai+rwcuZN+7FqSi3c+WzP2uBpSqSpynFTp3SbScVLmm076Wi3a+8tG0m2fD9tqmpaYkyadfXVot
yAk6288iJMvzYEiK+1+GIG4EjPBBzmFrHWWha+ktNRMGNz3Tw3BiwS/ztLtKgE7uS2ODjoa+/fif
8A/ht8NNTtHtknVDCLmaS+vxcW1uVdtrqjoqquSdquWIAIyTuc1fCfjb4ZTMPDD6jppluwLQCeAi
3uWYFdhm2GBo3IcbJHAYu6qDnFaR49w2JwqzDJ8lx2NoNKeIq+wdKUKcebmc/ZRr/DFJpzaSV5O8
Wr8dPMqdWPPhqMpRuuduPK0k+tm+mqu7dLvc+RdI0PUNU8Km5tztuTNdNHISV329rhpFJ+8G27tp
+7kopO5eZtM3wWFw7Z8tEUHgY3c5+bkDGBj7wwezbgfoP4qeErXwrOv/AAjs8FhaQQbU06E4+W9l
kW42jBDI6srAKceXngEAnxqO1t4re2tLtTHbz3kS3ckas0iw+YTI6jBJZY8sABjAIILAGvaybN45
rgqmYU7+wq1XOlDkftqaXM5Upq/LJqCp25LrmlJXdkwWMVWNtLTm0o681lfTVdbK1u+6abLfwy1u
LVvGfw/0BbXy/s/iiC6nmlkiMNyvmyOowwDAgK3ykknhQSWNdH8X9VOp/ETxgixbkTWoYQ5HRbO2
+y7c8c5VS+ScEDrw1cx42+GcWg2Vt408GarJqfh6a4j8uaBpGvNLnHmMryzQhREquoAZikqM0atk
h2Gj4M0bU/E954chZ7u9vtf8S2ltcTyBp55HmvEiaaUsHaVyJSz7tzMcklmHPLR/s2ri48Q4XFr2
EcJXwEsPUhUhUo4l4uWKxLre1lzUpr2XK6Uoqys1KUUjeTgoVMRB+7CjO0bOLTi5N3ulbSO72ukk
9Wf1kfsK+FrXwj+zR8I9OgRraeXw7bahcs6N5EsupmW7nWSLYfKJacbmwRjL5DNx+iOgWvlyCZAH
TyV2BcKyM25TsUDdlCeBg7vlGMCvnr4SaJB4d8JaB4e8lbdtH0nTNNV4BCsbG3sYYh+7ESoquhyX
VQC25iQVJP0Xog8kBJSxAYAlRhtuSy7vnBAPBw3Q5xlua/m2tiZYvF1sY7+1xFepV5nKVk3UnN3U
lF6qd9VKPwy5muVn4fUc6lfEVKijerUlVaSV1KdSUuqdt3Z3v01acj1bSbk2skZcGVSCoVF+Yrh8
4YkE7XzwDuGN3cZ9L01hKHhkAI3q6MzgL8wPyqwG4BjgkZ2g9WB3Eed6SsTxjyyzHJX5gGUFMjD4
zt5/hOCDlckkE+j6bGSo5UBEjUKSQcAMARuIAJxl+PvANkksa1tUqtclko8nNouVvZ6pu2qVv+31
pJMzUeiu1Zbvre2t1dXSW92k3a2rfVQy+VA6EgM4BMaluQCVxjdhW27Tk8ZbGSRgl5ePa2F1JIAU
8pwuBnCFG3HlgCflLKNw42hsENnLiuFXcuRLsYRnDn90xODkMRllBBCZI9Gwax/Fepqtilmk5TeV
Eh5Aflgy79qnJ7D7rRsTuwozlXxPLTqSqOzpQ0S1WvNFS2SSu9Ve63a1NcLT9+z3bjdN3+Ft2V07
30vp1a1a5nhNd6iWYoxKFiU/0eI/Luk287PQj8ccnDZKWKRFjRRp8hCoigiFCCAHAIIGCCMkEDHf
GDRXgKM3/O721vX11nr/AAuuv4aM7/aemlvsvul2/u/itdmfzMLotwZiZJIkUkkZUyY+Z+nQADbw
VPQgk/Lzv29vdruUTByu0Bgp2nYx46k4cMOBnBIyQ6K1ZazXjkMsUSszISs0su7lpA4UhQrNgEqp
GevOSwrqrEsY9ouoVjVVkuBHEAVZWbkEgv8AMoztwADuPRitfp1WlThKp9cxlNK0Z8sH9q8ruLa+
zJJxlu3f7Kaf+jNDExnD2eFwtXVLmk46KPNa039lrV2tZXd0mTi18yECWb5PL2cMQVJO0ByAu5XY
DGTnbksQSSc17SH5khi/enb9wMyuVZycEB2wQpOck/eyT0PRl9NmgYwzmQ7V3SklgrZIO4ZUq+SS
BjvjIPFYtxIIiEt5kVlCuu7ai5zJk7Sx+VlwGBYAqW5yu44uthlSp0IzxCvUko+0jFNRcpXteTv7
3vK6uk3G6krt0o4iU68vZ0Jcqio2nKUm07JO8FFKS5mrNvdPmbbWA1sY5mVLN0nGCSU+UZ3ENlkb
aSVHTjGCSC247Fvpuq3QWNbex3lDiRwJAhAddzICvByMkNkEt0GKjltb26kMy38UY+UhIJGd1DZU
jcGYMD8p2/LwVOSRmmrayq8arDdTEFfMcytGd2WywJYOcHc3A3AYI4HKjVpxrf7Fh4ylTS9nXqVJ
ODXtJ875Jp0k5NXtUUnypxakmjKrCuqc4YpqFKpaMqVOLi4x5nFzjKnJSjJcz96m+bS6ab53bsdP
udOd49auYQGdWiNtLvhIJJCmDd50THJ3jayDao80g7j0cJUhktbYyoCGSQqQGBOAe+VUlcZ+YA7W
IXIqpHojaiksYjt0EkRTLh2f5g21w6kMGz6HJIGGwDVTSdI+xR3dpc30zvaMSI/Okh2quWG1xuJD
ALhWYE7iMBg7V9hRzDE4nKMTj8FhVQxWXypPHUcPeFOrSqOUHiaNJRai5TbVanB+xvzSVotxPja2
W0sJmmFwGJxk8Zgsy9pHB4rE1W8RDEQl7VYarUlO1RKLboylBVrcsW5WlM3J5VFuv2iW2tZdwRk2
bo3UbxuDEb0OQp+UuvQEKSc4U41FYnNrayKrDIMmUjkZS3zRTFiY+ApVTgAs2BgZp8V/czOx8q5u
GGFhmliWRNqtJtJeR9/DZHykrjHz7dtMGn61rAkiub+2tVQ42ws9u8kbMQVLlgiOcdRwcFiSCa8q
lxFSgqiq/u24xlUwspS1jeopO0JOVNtQjyWvLm5opOSPcnwvOr8EHNRV4VofC92lOcoqPvWV9/dT
abkPsLGa8idrhbWCaTAe2ktxKGYZXzFJCgF8lxJG33zt2EcVZkhh00Hzr20RTg7ExDIEUsPljCsX
dW6hWyQ2N2FBN2y0E2W6IiaeeNUZI2n84yAHIZXAVSwGFAYs6sQCpGTW7PYabM1vd6ppyRvFsQma
FXIDtIm4kKSFLK2HGdqsA2ApY+zRx2ClFQo1sRBVuSSjWpRcqKu01T1leLVpLRSScXKPM3I8mplO
LTmnQw0owUXKpSqz5Jpc6lefLy86s7LmSberSXMcjHNYTIzw3LuoUNKVimw3zMo2+Yvz5/jyG+8M
K2QTDfRJJs8pYookJHmuzMhDFiAfLVjyQrAMAVxtJHNdG62TNPHZRxTmIMY5CrIoG4llZ0G3cONp
KLkHcTtDNWdu1A28q3CQxxHBjZIw0gALqNhJyc5J6YxtBPINelT9tVp1qcaEpuCa5Z+05op35X7P
kvJtu7TUUlOKXwtnGsPQjCLq1Y0qScf3kFGpePNZrm5npdJSfPvZXumzDGmgwboJZJHjxuaOAAkE
vyGLkcKVYFsYOCp3MScafS8I7iQ+cMHEpYRZ3NkOikg78E7hvXJIIJG5u2t9N1AhvsX2kvgq32mF
4FxwQ2GjJw2No2kYbad2DWTLoupSSyRXVxgOxbzIYPMwd2SDK0hweBkDcFHUbhk5qniW6EKc6dGp
ClCNXS7TbfvPlb5XJLRW5nZWbi5t9FCnhX7VqFStSlJR59IQkk37yjJ2nzW09/3XzbybT88vbV4V
BVEglKqUaBhJEQzOwbCsUVSMb42YnOCqFvkrn72wsLmLN/Cjt8wN1DGglSMO4BD7twHVSDlSS5Cg
hhXpMmi61DOyCV0jIRQ80se5yMjPloGaM4HY5Izlm3msC60HDyow8ttxSWRUmKKd7gMGcfu12nKK
IzySBnAJzrfVpc2GzOkqsZSp88lTUozTcfepuUZNST0m04VNJKLblrssA6lKpGhClUpOEk6dVpJJ
ObUXpbXvrFXi+ZJSb8XvPDmi3xuEQpdwlzHJbiJTJEp3oXKgYkBJwCmcNuKqNztXk/iP4P2u631H
Q7uS11K2lMtodixtBMn3HVwC0bu3DBvkwSrKCHB+pL7SbKxlEZfzzLgs1uGjlDBm3E+UyAO/y8kF
hISONpNQpa7o/tE2mzvbxKyGQlYZFBZv3sqMJWyvLMrpIgODkBRXhYvhp2nPKa7SheX1fESlKnVh
N6Qpz5JVLOFoqNVNXladVXkfIY3IcPVo1opQjOUVejKMnTesuaMlzSSVkre9K/vLkVouX4jftMQ/
FSHW0k8Yapc3+kSMILR0iFvDDMDJ/o9wkSRqXKxkxSyf65ASMOu2vmzR7Sa61LT4LeOWWaS7tY4k
iDGRnaZQoAHJZsjaB3xg5L1+9/xY+GPhz4leFNY0e5S3F3d28gsZGhJuYLsM7wtuSEJvimOVYMdz
cbArFj+ROjfC7xh4O+IujJrFg8+n6dq6tLdQBvK32bSSrDOhCyQSuURtkqAEEFCwwa+74Xzqlh8m
rZZisHSy3HYKhKNLCqnChTxUXCq6ToqEY051pO0akabblNuScm6iX5tmWCeT060atGNGhTi+Rqzo
yVpO0ZxbTb3Sb5l72l7m54nn1DX/ABXdWrlo7SJ7cRxSFmaBre2jtJEYZ+R98Z8xAAUcnKlixrlb
m/0aDxPp+m6yZF06Zha3VxDJ5c1oJmeIXa7gwkEJ2tKrY3xhxvVxvHvTaDFZQ+IPEuoKVMktxOit
kyNJLNM4ChgcqcsM7kc5bGApB82l+Ej+LrFNXhu2i1OeO6mawceW0gbzDZiNnLYJJDZxhlwuACWr
s+s5dkeWYbDZhiFgqU6FPCxqUovmjVdJp1lyxbg4yTlKpJcvNyOo1e7+QyzERzDFVnC6pYdezUoa
P2j3ej3Vla7avt9rm9MFzqHwssPCH9gw6f4h8PX73ek6yDDBe6ff2t7IZBa37xlliujHIXWO5UvG
AyAywBifsb9nn9niP/haPwn8W+CoV1/wJdSHW9YguDAZdBuo5ZZY4XiZszxQ3DRwIwAlilgdmBB3
H88PAWrTfCiJrPxdYy6kniDULWK50GSYODaxO8H2nBZwk6mQvbygLMjrEVYqTn9dv2G4fGnhX4se
OfDcE1zL8PLjQ7XV/Dpv4QwT7TNFIWs7oqD5kcjyQXcUbbBNGXkVZWKt+TcTfWMrw2MqUsVTqU6l
PETnj7qFHiGlUrxour7OE5cuMy6rjLU5wk41KXNJSdNezWmb1K2EwOJcKijL2VRKTavUUlKLbjK6
coRbcVrf3Vsz9x/BJS4aNWcrHiN0Hm5ZNrMCoUgYJJAxkEEEgYBFe+6VCSCcM6MgRjtbJUEiNyM5
JJbdkHIGM5DDPzf4Bule1UzkQeXIY5XyWDeXIfLckKOWGC2BjIXdgDzK+m9AlNwkTxsoQsS0yozx
MCWUBlL7ULYxzjrhgCtfnGGxUanNyNzi+Vxg4TTu3Je61JKMdHveLVtW1c/KOT3Ze8lorNN3fvSV
2ne/RXWqstdeZ97pCOkfmx7wy7CQpMe9cuTnIyGCgc4zlgWBIyPRdEuElikbbhl2swbJfLEjDcZI
OQAegDHk4+biNLifyhhtxDAjJ+Ujc2cuHOOOikKBgDGc47iygiWJZFAd0b58cuBvco2OcKvAJHO4
rwSvPZSk4p8zcbX5YxSb5edvmsrNvSK1drWVldNxdqNkrtW1s1fWS9LLRtb2b1vz32ZYlT97MMxp
JHOoRSrFNzgGTaTkD5QRtOV2jGAMee+JL64u9REUTRmOCXdEjJ+8xvIdT8u0kEgo4OAWKnayyCu4
ub2a2jKgbwyeWWJ+YfeKAAk5TAOAQOMnIJ58y1zTZIHs5El80zsruiiQyoC4Em44DgRtk577iGcI
Grz8xadKcIqTTdqjjKMZR95yi1F3cpOXvWg5JWl/K0+7Bq01OWvKnyq9m78ybXXRPf8AR3O2h0+6
eGJxKuHjjYZkOcMrkZwcZx6cZJ56ZK4bz5EJVb27CqdqgSKBhTIBwGwOFGB0G5ueOSvNjVmkk3i9
FFaeya00e9F3WvfX3rt3TOv3f5Y9Ps+f9X8j+dJhO5JQShvM2SEwNGilWclsmRsABjggEDKsrHjO
lAkKHZdyhCdrRu6yOcBiMFYzghioyCSQWJycMDdS6Jm8tdOnmH3X3uAxBDZYsQAGAG4NtORgsrMG
JDHf3ZEMcNtaDGY5V8zzMBnO1gS2xuFBOTk4DEqSD+tTw+E5akGqMmpK8Y29pT9+pGavGo1ZNR5o
pRfMoN6av/RHD08TK6pe1tOMXGc+ZU5w96ztFWbbWkm3fWzune0NojESMrBiSuGCRspZjvCgA7Qe
qkEhmIxkFjHNbQxHMrRMzooQL5koaTJKZ5wM7QMEDBJycHJYmkMoUXUd5fyKA6srzRcliSFdCA3C
rw2QUCnaT8tbeUgtVC4tQcFWlMkjDIcNyEc7zwSSB8pPzZVqzm8BKpKNSNaU6UItToqEYJuKly3q
SbhKSaT5YSSut5O76MNhcfGlOtGVKHNJ8rnzub5ZOM1KKjHm5nG8HzXs276Gbp5dXaN7O7Xbt/1E
SrG4G8YPGOO57jOWB3Vurb30vzJa+WFyA9w64xhgMGRupGCxV8Z3cDbmrVrcQ3UOZLxrhwpB8tXj
3JuZTtkRcZGAdzMG6cBvvZc1zaRvLHNaXUgR2CStdOdy5kDNIHYbfQYyGBVi2Mgksrx9HC/XsLhl
HDVpNUalSrT5r0+SdRezlUg4Lm54+05IpuLjCTbu6pYrLcVXqYHE4hyxWHhTq1qUIyUVCc5RTdRK
rC7tdU+f2kVNuUb6GykEUoWO71Ww0+QHaoVxkkFi6/Kdm44PUAPkEKSwBq3Wn2lnfwyJex6jDcoF
uBkYfBKkkqAd+w7gCw+YAbhVLTTpcm5lgso1SUMQ06SP5i7irshJYHjO7cSQQNwKEG1eatpt1PHb
XbvE0ci+UbO0aQ7gXVdhRgwQ55Bzj5SSAS1erwvmOMwmYUf7YnOjhMXGrhK1Gl71NUqkZRpqbpU6
lTlcvZSb9pztx+FWlF+JxRw/hMzyjG/2CqVTMsJUwuLwtaqoxqLEUK8HOMHXqU6b56XPH4HG9kk5
O50QtpIEaOCyRbJvkQgKqt80uWCglw2CobIznLE7iDXIX1taafJNMbg3C/IGsFdjJgSOkqq/mI/z
BiNrNu5cIcgmtu/n2RLBFFrd1DJGOZEH2VBsbbvyxKE7QQ8gIDkMXA8zGGounV0Nvp9usIVXklka
5vACXAlVQxUEgkgHIXI3ZJyfOWWUJYjEz56M40lUvKn7SUoOblZzcoyq8jinKNo6zbvJzUmfV0MZ
W+p4aDoyhUdKlGVOSgo83J78Fy2pq217uKi0knFTZ02k3qJFGbSwmSK3IytyDMAxILESf6xVAAGW
B2qw4bc9V9W8RRXEscJ84uJMi3ghWSIoGZsyFdoPKkDJ4wTg5rIsl12KbZY6bf6/IVRzk3FrBZRM
zBpcgABAFGCCqDcVYg7SewXwaZZBfXdxc6fIYw01vE9uIhjeSx2ozNnHzfeDOcFgck+pgcNgIOlV
eKU6qmm+T2sJTtKorJ1HVlGzdpRaptpRulKTa83ExxlaOIo/UpUqHJGUZz5PZ2bbTfKlB83K3ZTm
rNczbd1xS6i3nugggh3Z8tGwJs7nO5Y8/uyQCGOWjBwdxU5Oxo0D20xuLi1R42cMk915cgB3PhEi
SQJk56nI3hckspatZNGikuDDZp5yxk/6YAHYHnDZ2YO05JQEDcoGVIy/R23hm0/s+Nb+9HmwuWd3
3xqyk/K4jSQr1GCpAIwGBYZr7zCV6lWFenGmrun7tlGVaclJLknzSulKzl1fw8ukj4HG4CnGp9Yc
pOEasG41JTpYOF27ySjDldrNyS01XNK8WZiM5uJHW4kkSVcrEZWSCMlieI9rAENwR8oVSchnHOTr
kVhaw+bqOqPZl3XakaAxSnc+3ILByWCgMOpXfg7lZmu3moyLMNP0aAXdw3yLJHAxVSpYkszthRux
yTwQNpYbcoPAzav+/wBdBvLyAr5UTSSLAoLFlXcoZUIIUAmNl6jcVeuaeX42CnO1KhNqNTlbmsVK
15JqClywTV7KXK07q0m2yo5jgKt8Phl9bprlTrUpQjhb8zT9+7lKUYp2STu7JySUr+d/8T7UHK6P
HaxwO0cRvrqF1AiBkBlKkEuSVJBBAxtEgLBnp0XhG/8AMWXUb251Ji+CY5IAoMe5nQRNJ++hdDtC
vtePAAbbgn3LSvD9jbW7/bLU28xMflb5tybFyFIHl7U3ZKsCD1BJXrWJqtlP50zW4eGNGUyDzcQu
VaRQ67w6Fk+X5UI4YqwDrk8eBpYvFNznThTXNTi5VKfNJ0vaTv71RXTlFczcJLScbvnTkaYxYfAU
/aKVSrZqTgqso01JqUEnTjOScUld8ybk0/e5W0vF7rS9Tt7ycw20csYkjPkqjMIkDYPmAvIZFKlW
IjZmU5XICoWv2mkxXwnhvbP7KscamKRXcovzPhRE2WAOwBCzYUMSoADZ7mCGaG+uTbyfMY/Mk+zN
Gjbo3cn7u0ggbunLFmz8oBN0AWenzz+UL8yugAu+Z4I1MqurSAB2QllHzuVzI2XLDce5YGUatSMK
lowjZSUXZtt6LXRJRjzNNtc0Fq7s8iOLi4zqTpymm4yiuZWindpRb1kmt7vayasrniepeGonWUxR
yPJHwhtwWDlmPzruaMoW2q2HPBYDPRK5XUfht4J8RWdwPGdlfSXsYjWxlt9Oghnf/WlEk1NFaSMK
CWMTM8L7d7qxG+voKxjk1Rb60/srTYEmLmC4dJZbmMrvJ+dXVghJyDl2KEoSULMcfUNNvrO3CTSx
RsI4yiIUYMkbtuO4F2ZW4ZsurfL0CFwPQWXVnQo1KspyXPCqpKC0SlJXjNaqWqipXU76ptuTPBxW
Ly/F1sRhq1CjVp1YOE6NWCdOdpShKMqc4uM00oyad1Ztppps/M347fs8+PJPD8tz8N7SLX7OyVpZ
9Dmlt7LXH8tmcyWyzNFZ6iqIPMa3iuIryU5htbSeZsN8WaL48vtC+J9noHiPT7rSrAx2Omm1vbK6
sruwv5Ilwbq2u1jubciZxFJHIFkhDK7AqHZv37ltdKuoWVYLp5jCu91A8uRsbfKALnG3jDffILBh
uVQfMfHPwY+GHxI0kWfjHwTp2sSwTKbDUZVe31nTZ0ZHX7Dq9k8Op2asyq8tp5/2K8CQJqFvcwII
6nG5PQzLB1o4x08VzYevQhFyccRRlWjC1WnUc5KVWKpxlGNVRknKalUlFs+KqZBlmAnWhlOGnhIV
EqvJGVapR9o+a9ufmlTTktIxnKKT9yCUbH4g/F6C/wDGHxPn0fQNJYanp72trbiBgskszgXJcIW2
I0ZJJZP4FZiMrmv27/YO1rxC2g6x4S8XxRSappVtpk11LCkTMksjzRskcqllG8RNKwRvLLZOFYlW
+XdX/ZU03wt421n4kaVd6r4guDp5fS/D06W6Xq3NtamFUt77zRbX07JGrxGdbIl/3W5nUSP9p/sN
aLet8O9Q17xFoV/oviW+1u9sdSstRtZrHU4P7OuJBbRXsNwkUqZhlW5iDw5CTlo2aJg1fjfHU8Xh
cjyvK6+WVcPhcqw2EoRxlehUcqmY16daWJVCt7Sq6+Cj7Cbm6cZx55Qu+WFO/wAPxPBrKq0ZQ5qk
Z0VLRtRbqJ3i0tJNLSLd7NtptH6Z+DIQiuyFni8yPchUsM7vlZ1Dl0JKFgclH3DowYV9HeH38uIq
7LGku4BfmIw24jcAAQCp3bD8wJDEE5WvnrwgjL5cpVFywGX4k2q5C/Iqr8jIEIGQCQzELlTX0BpE
UjQRqkjEPs2McgBl3dc+YFG0AnJxkKVbO0H81wdaDpKtJOftIw5YxUoSilzSg2pPmWjUnGKbXNCL
952l+WSi1CTjZyT5eWd07tyvZLs47bXb95uLv6npBkjQqrsylQX2gNjIJU7SSSVypXa2cZ7DLei6
aVWAESiRiqhghG5WJIQkDAztGTgYHzDggGvN7Bgka7VAYlB6ssoMhAbls7weXO4OeAzYzXX6dOcl
1VhyucAhty793QjcqkjnAOMgksVWvVhWVJ62blBXbcrJycrJS0btZNuSSb0taNzKNuT3k7vl0t15
ne/3r0s7p+8jeukZ4ogQnmxyB2+9IGAYk5RiQrEE5ZTtxjKhyTUN1pd1qlxFLE4jFkoW3Y7ijxzG
TKNGS4bHlkEcHkMACFYz2sklyyjYpG8EuRkqBkZABUHcVVyei4KtjBJvR6ksMstq5CHIZQgP39zA
MCG2hSvGQc7s5IIyJ/dV48tT+DUcVF+7zKcJ83vSvok7OEoNyU+SSknzHRDnUeaF7xS1V9rtO+uz
3aem109Ssvh1yMtBbs2BuYREBmzJuYDsCeQOwLDkgklXGv5Nzfvrs/MeQz4PzS8j5+Af6qOqkkrt
+qYPu+n2H5eT7fit7yJU/wC/Lp1flfr5fjLfS/8AMlH4ltrpPOgtHRYVVYo58vKyhmUhvLADHGNr
ddmAcOZCbMeuzC28qMQ2zvJkxzblCnccfM5DKzBRhXwPMKggsGJ8mi1a+EIDxTQSAKCy2JMbAPwz
MCRhioAOTtBUDcdyhJb6S6lQ3zXkxA2/u4Hwu0kEqMEH7o3feYHK8Beft6zpwqKpiKcHUqLmlXjK
rNRjUm3rCT966V0+fV291P3pf6ZYOnVnF08PiXGlRjaNOVKlBt6JR9otUrp2tG9rpJtSb9N1bxZb
24s7a+1GG0JADIkcgMqSF/mR1OMsNroxygckSKYwc4+seIZ7IJBZQS6pC/lOt3JGbVWUlmTfmSV8
gH5vvIeSJmBL1iGyhuxaeRp0s8UUJaR5XYqrebuWQRyhmifhQVhcjAYrGCJS21HYW0soiuLueZCo
j+yQI0kYG4oVmSNSVUgYYswZSMggkrXLmWPy2gq9GhUpOrUhSfM6Ti5RUXFxdPDuTp+7CN+eab92
XNZu/fkWS5nWVCriFXjSVSpzUPbqVN81ap786mIi51It+9TUKd3GXK+Zw1dYeJ/7VMVqLlLaUEAw
WIXOVJzGJWOZM8ZVWLFsqFOGrdbTkuWYLp2o3EmAd19fC1UOrMF3rHIAFVl3FGCswyMckHl7YWmg
yTJJNpGkQeZ8jXcqlpcM5UKgZG3KRkZOcgDJJxV+68ZaSI/KeXUtRWNUINrC0Nm33lIR3ZGG3K5Q
kkv14BNc2X4vMcVhZ0aSlX5p00qtKLk6Xs5OUoudJwgudRirSqOWkFJJJ39jMMBlmCrc+Ir0aLpw
lzUqtoe15nNKMadWcpzT95wcKXLfmSaXMd5ZWl2IxDHZaNbhEXzJII/PYBC2WmkLFgw53kn7zsSQ
Mg7F1peozIjprumrbiL/AFFrCouHVCeFcyS/vHA9SBkfKM15Fpvjixa5MdnpYlEhH7ue+ZSGAIYt
HEkhyqglhuyQQ3IZhXZ2Xi/U5WMtr4at1MGIwIY5JI3Idjnf5qMc/e3MN24quMLk3Klm01OioRpW
jKMpzq4enKUZVLNSqVala1mopWjdNr3krN+dh6+Qwm6sa8prnhFRhDFeypzTbbjSowormtu5Skmr
aqx1mnLNbK8CaXql65X5ZZXDIdkhG4GIk+WzbeGLShGKsASMdPZ6Y7uk76QLNxGo8yJUOGJl2u63
CZlVSRnBDAMQQWGW85ufiD40MM8Nvp8Vq4jLIIbdEkXaXzy4kweTlSjHcCMDcai0PxP4suS9xcS3
HlOUEhvROBG+6Xd5UbxoMHIymCF5wH25MrCZ37rpVcuw8KcKdJ0416lbmUJpy+saxp6vklrzQcZR
fNZcz9D69kyv7SlmWInrUUoYSFKLjJvknTXPKq4u/wASautZbs9iaC5jKs9+0aDbEzRTyQYUtKu5
liZQA+0ZAzt+fABLVRuX0hJHeQzXk2diSpFPMWILKCSThQfmG52C9GZguTXDa54j13TY0bT7a3uP
NZBIXikndQyPvC/vQpVyFwvIHHqVPDrqXi2VglkL22Erb5oo7UFSu9l4kmVhgYI2qd4B7gk16MsD
WhNqrj8LRcakZJ4NwUZe7D36kqUas4xcuWbUr3acU4wbkvNlm9GUX7DAY2vGcL8uOw1T2kUpNRhT
hWlTVTR8yjquW7V5N39p/tNNPSSPTrFI5nUbWmdI3D7jyERnLrjG758fMoBy7GvOdb1bWbot9rnR
ILe5hxBDfxpLJGWkZ2KsiqwTA3AsGw+QWRWWqum6BrF/I80o1iXe5Drc7AUDCUK0LecAU5DbmUkA
FSSOnW2XgO+l2k2kCp0IvLkSZTe/EsEK4JlbdjY44JJYsCrfb5Ljsuy+qnOrSr1KseRVouSq+7de
zvOpyOcpRtazl7km5Jtn5/xDlmc5lh60YYXEYWipU4xp+yXspwlKV5VI0qM3ycurTd1JpX5Wza8J
eMNAjjFoDI0iKWJcTPt2n5ozK6bATjekaNtKlmVQFG70uPVVnzLa3EEcciRmJFRXd5MkBTuTrkE7
CofaOTk7q4nRPAVpbF3u4oEBZiIokSOLBJHlhtpkdRztLEHDBdzEthdRXUNEk/4pzT47uCNl89Wm
ZVjAZyWO9d/7sBQcEswwVY87jOc+w1GhKtSeIw8oVFRqzqudrSXMnzyndRs3bk5rRvs2ZZJkONoy
hQxSwlei4RdJYeMoVIyv769goyi5XtJvmTcrvletu/bVZGZIzFA7qIyC8K+SE+dRhCC0bqTlwmOc
KyjOKtN9lurW4hlgtD58KhW2puEgmZzOgjeM442bCkn7ppcIshWVeEt7q7vbaS8vk8v5cvDGhL7w
8rFoXVwJQB8w6sylAyhsqdvw/dRSOQ1lPLAhQrcy/u2AZnUqIxOzFR98jAYEspDLwDh7MIZjTq4u
Mq6pWSlGLkoOzceZSnFRSmknJNSaatZu7Lz/AAKwM6WCi6LqVLSUpxk5KKlKySpzvzRaSanJJpyu
mo+9x+saZzJLYRtm1JIWCORVfcWAdmZVIwpJ4BYfuzu2RqazYZJbyJE+xXUUxz5siuzRSEMyMvEW
1dvBcl8KcDAXJHtMptYvO8+2tvIZjtaSTaGDs/Hl4BkJ+ZimCGGSMqrE0WsdR1EbdPFlbW6sYXYw
wxqBudS0buRKDtXOFyVbAyQcj6OhVlVg3TjCEYTavNc7qK7XLJ2SU9OdN3clpFOzi/k8bg5UHUU6
kp1GoyUacOWLT1va6utGrxe+6dnfzzTNOtrWGf7FF514cMIJpp0QE481VVSEZvvYPLEkncMAHLuN
FvLuOV7x4bVYLkf6PcM5cbjKrsiRpIY8CPcpbCs4OWHOe3ufD+oLceXFM7KRslSFxKsrbZEcIkKq
zbuOAQyvtKBXjWrlp4aac7inlygKpecS7yN0jFWLsXU+qOSByQTucn06ObYf2cqVeFfnilzuNOVJ
c6lJpqMpXnGbVlKL95pPlUW5P53EZJjJOdXCuhTpuzjz1Lt30tPkjzRSavZ66pKTSbOAXQLCFWCy
m6bEZJiU7iH3D5VaRTl/4NwwDtCggkB17Y6bHCd1rcB0REMiTxwOVaR2EkokhniDqMoCvybVJYNK
TIfR5jeWEUqTapcrKECQwxxwD5Y3YMpk8vLrjkE5AwVJOAxyLlbqS0DSvArsFKvJZBoC2TyzZ2kk
D5492NxOCxOD00IUKsPrMPZwhCok6bpOdRzu24z9/aWjvF3UW1fmWvjV54rDN4WUOev7GVRVnWca
TSUldc0b82jShOSTduZpLmPPLbw74ctfMuTdzTTzNtZLOeC5aOPO4KUnsraOVcKuxoHYI5dXVyQw
7vTbq10DZNYz6pKrtGTDts5YJ9xY7GiViEmXGQynzAMgMCSGt2U+rWii6A0tomaOO5K2cDIFLnlT
LAHUMWIU8ELgnIZid+S7lnXyn0bSbiJjsWVdMt0lIbcATIoXBQKAJEJY7jktucVWNy2jmOEqU8dR
oYvBVnKLw9agp04JOUbTjUuk2m5R91TS1UlKTb8SnUoWq4Srh4xqSjF1YVowlHERnKUrqM1KM1rF
tttOV1y2jr6Z4V+KvhxJLe11Y3GksRgXLQFrWNo2ACyFN08SPkeWXjkXJYPIi/MfrHwlqFpe2aT2
d7FcWsyFPMglimiZ8tJuSVC8asAR+7YqQQFYGvgoJ4eYqH0a0WcKqFo57yBkHzCQBY7poMgrgL5Z
UEhTEWy1aOk6xq3hG7D+H7i+sSwYgR3Rls7lQz7TNZyQvbzfKQAjqSAFKEMqmvyXOPCvLq85Ynh3
HUMHXpL/AHDE/WHg+eUYwcaNRRlWo83Lom61PmbjyxjaK+QzbguhinKvgYvCVJcz5E+fDO0pNrl5
nOk/eekOaCXKo021d/pzpJdxvI+RQqlM7ScFsFSOCoIGDkHOS24EE9xYmMx7UjOA/JKIA/LBgsiu
SpUk4DYJ7jAJr4p8A/tKWTCPSvG+nrZTrtVtY0+NpLMrvIDT2Zd7i3O0/vWtnuASRttETe1fX2ga
7pOt6cup6BqVjqunuQVewuI59hKyNsnjV/Mt7hdwL28qLMjHEiKd2fyzMslzPJpTp5phZ0Ze9GM+
SVSlVqatOOIpzlRmlFKcop8yXKpxTUk/z3H5JmWWTccXh5+z0tXguehOPNJJqpHSLdvhlyz0+Fp6
9PZvKHnyG27yqv8AKRtUv94AAqenOOMENlhWBPdFXvWLqUdQowTGXIkI3pI7OPMK5JAyCNvysTuF
wyTRxF/MKqElc7SAwYCTrg5GRkkNluSAxG7OfpmmzamJC0qAyP8Aud+Yon5I278lFbcGzuwGXCux
cMW+brVKz5adO94tSp01a0pKS5pNXbtFNuK5XFvkU3ZO/FTcYc8pRlJNRTs3ouaSXyaV1e70dldt
CJqt0qKoN2QqqAdsZyBvAOfIOc465PY5PWit8aDdRjyzHb5TCHKR5ypkU5yx5455PIHJOCSvVU8V
ZXi9o39yr5X6Lu+nfazurw7LpbXzX5q34dT+WyW4nM6JHKG2HcQYY4EZNyjCbJGyoBI4CuBnJIL5
hh1ueN5P9EAfeBC/lyy5ZWdSUKptbkA4AKsGHOVV6wdE1u1isymrfaI9QjJaWLypHwoJGYeWbbIB
lXClOWViCgrsbLUtORA9tiRZSrxlYZDIMZyHDJvj5TLLgkMzfMADX0eJnO7lLBSdlGFSopezjP3X
adVRp20UtNNU3BuTgf6q5ZKlNuNHHJwna2GqU3OpFNtXUueLbhKynFXs3DmSbi3cgg1ySJrq6iii
svL8x3mAidR8+7y9jKygAElCRuUMp3Asa1m1C2ttEgl09C1xNcC1eaApLGzTJILVmZkkO1jE4YOQ
WKjYXDMawrnVLu7tZY2QG3+eGSCdMExksSFIwWXOcBCSQQVO5BmTQ7eztLK/gtbpvOurddjuXESN
A4lihdGXcBvGEnxwSFkLLkjHBUMBiKM/r8aSajL6tTSfspSScoOfLKnKdRzUFKKcuaM2uVpNvuxF
XMsFK+WKXM/YuvVrX9rCDqVI1I0VJXjGcG3Ts/cqcrb5Yybvx/C3+24kvtdvIV3MJJFhyJkYmXnz
AdrEZJYADB3KrlGZj1OmeDvBWkKvnbLrysZkvr52tsfvAoMEj+WhcHjao5GVZl+WuAn1jUrFZVnv
r8KFBeOFj5QY7mTyWQv8jr025BU5VtjYGhol1pUluJI4XNzMSXeeKSWQOWYPvdlIVgApJxt2Op3E
5p4rMsTUpqjDEV8NTpcnJRowhh4VG7qN5SSqQh+7leDUpKVoppN39DDZLgYc+JeBwdWvVvOriMVX
liqim5NtuMeaMpbXlzx91tWVtfRRdeB7ZSLbR5CxVQklvbRYVY2k5SVx88ZAwFDE4Bw2RXQ6XP4e
eFiYLk7nRiYlmD7W3HBHllQF7gnGcqpyXxysF0YLUy29gsuxcqXdY4c7ipJRVD4yoY7SGxgjIABq
p4v1COQQnw+PkxlovOMIYmQEu5IVsMAyqvXdgMTtNeZHFOgqvM5+0pyjJ1KuJ5pODm0+TnaTd3Jt
091o23JI76eGU5U6dR0506iUFTpYDkoczbab5ZTjFWS5XP8AvO91I9ButQ0KEkeXMzxbcOsCruQu
7YbzMMRxxjPIlH3iDVWW/wBLnRUsRBLcOUbYUaPyxkgkgL1BxlOTtCnqUB4a51e+u42YWcSOpJcv
tAQBnJUoJWLbAMLkggscgnBaxFfRy28JgvbWK4TapIuo4pfMBYkLCHyxUABNgDFSCTv3EdWVZvhs
Tia1OtGNGMoOFWqq0VNONXWVOpOPvOcYq8mo8sG+b3m7LM8BiMNhXVgp1vZyjyU4UZTsk3yucYzj
eC0vGLd9E2veOmZbjC+dHa7HBXahdiCWcZ2uCoUrzk8DIU4BrYsvLh3JIBKUwwUMQyorcdgrAjHd
uu3gqxPPo2qXS74XiA+XfK8Mk+4AvxKTIqDdtADAZJJDuSWB3bJfETWwtjNZxLMExsiUyb8uFUSM
mF5UAj5jg9QWJPVamsTVWHxaoqtyxpWrxqPkTejqOVloouUlJK7ahFts44zfsFKvh51OSKnKTozg
ru+kabbfpB3la123dnR6bq6xy+XPCY41G1AzfMV3H7gVHBXIC4LAYY5fIru9PY3QUi3mcMQTHE0f
ygFgrZzuPUNtyJOAWDD5q840/Qrp2MmoX9nDtVCswMjSshZgY5MAKGTadhU7SAQwOGevV9K00RwL
DbajcMpH7uVEWQqCCMs6KNwT7yhyzKXw5AAB9SnSnRopYbGU6lb3PfUW6UKjlaPO3TaTnyuLeqV1
FSbftF41SusSqsauDxNGnG3slOcFVqQTldwgqjat0Uo3cXHnTcTootIilDMwESqAjqMkyEGQfKCC
MZPPQ5YYJIJZ9l4dLxtJG6qrZUqypkrknJZRj1z1BB5wxpljoesWzrdfbHulbcJHmKoXjxIu3CSl
sAgKpcZTkAkZDdXZvPGhtnsniBAIkDMweUB8gMGJTcANu7quckldterhqsq0KuFxuIwteSqc8/ZJ
cyXLZONOdRybk+a/I21zWmrRjfwakUpKrRo4mjGKXs3VjbmlGcvelKEHGK7LRO7acmpo5mPwnAEl
QNzlW2mHfER8+SQxUg4ZMsOpJVDgFq07XTLC1heJIopSVyA2CU2uQuzBU5JAIx0UAE887cGsB/Nt
LrRr6BkXAuFgkkidTn5hLxtYZBKkMDkqHddrNlXWp6Zas4llmQqVePEJZHyXDE4XcduAzD7yqCcl
vlPvUsLiKXs6lFTjRq0qa5FXg4zUbqM2oVG1tZpJK8lCeyt48XhK6rRqSpSxFObUZzpVFKLnzScV
KrCEnFu7T5mndyV7Gdcx27wztLJHbyRMH+W0ilnJBYceZHIG/hKuCSoVSSqbmbk72KW7gkaxmuyJ
Iy063OYXBQursViZEQFUyoWMsRgZUMWPoJSG6ijnnnRY5AvkvHndsIco3IXBAIVgy8NkFiQxqqmk
6aJ1AkeWV/vJ5zESAmVctGMkISB0IUBTyAOfs8kxkaTlW9jKdODTvHl57qUvig5SVlbmi3NvRxcU
3r8Dn2XzxLeHVdRq1I8sk72knJqLTjLmjdK9kmrSteXKmeXW0WoaWrpZTXDS7Q80gIEMWCXLZZXM
hZE6gEjaRubagPQWF1dQzrLNcm6WdOWJ3ebkOSCUjDDaw53ZUk5BLZJ7C9024tt6WyWpBVsiSMMW
j3SEruw5OCFJyTghWK53MOLlulthOmoRJEEULbWsYjUMpIJkAUy7GGcfKBjB6tyfYqyw1b29WLou
U1BxppP2jqRTjHlhFXioxtzKMox5b77nzUcLisF7DDRdeVNSjz1FGUqEKXM+aNSpJtPmcW0nzTtZ
XTV3tQWkWrTowW3me2IY28qRiZQGm/expuDzRttJJKbkGNwwgc3NY061ubBLVbeMhl8yNtrR7MHD
CIDKB+ORjY5IO4MCtQaVNZY/d+csj5uIbhZ2uJQVHCy/vPMiDg7STuj3A7wDvLbtrfx3VsyWVjc+
ejEGF3ATIeUyYhCs6jCmQKrbmGV6pg8WDq1lXlTpprkcWqvuLmcZaxalpze69NeZJr3veReZYXBy
otylFwqRs4rn5le92pK07Xd1dJR1V9bnn9toF/JaXFtJHcI+NsMzQPLHN8x8vzGVdqvgYRiocsSu
SG52NJ0i/htXhn0+9QwAAyMnlxEZch9giBKHBwxkI4UgkK+b1xazC7jkurCO4BgKxzx3M9qUCksi
4eWTJJyQQwU5HzEDBxb/AFK502UyWrX8yy7hPZyXzSRxBSRG0KsSr8hy21yVAJKqSSfq8NjMO3Wo
15RUZ8vdU41VzKXvSilbRqLtq+ZJtJt/m+MwWLpReJpwrTdGdkkr1ZUFUcYpxvJ2dm0otpLm73fQ
JoUlzEGltyGZwFKFTI6qzliV3HjCDg4cBzhQWY1SuNDNrKHmlvIPLBATy2dWUMG+UPtBDKAAVd8A
4YEqTVLTL7XJ1eaOSG3GFKwiQs7Ar0IZQu4/3t5UbiMkqcxxy680s7m8W4EshkEKytcGIIW5MZII
wQACvCjcASBzm8LgedqFWl7Tng1FqVrJuMW5qNm4tapNKzTd5Js5/reLUYSnhMRGm4Xb5kny8zcZ
ezUr80nqoNLV2b0TKl/pzhnkW23xzLuhlRid7F3GQEd9r5PKlsYwcEHFM0fxN4p8G30l34f1m70z
UhhX+zTyRl0R1ZkuY0cRXKsypugmV42IxLExUk2ZdSnXYl3eYk85IkgKxwxib5wFZpWRslGyEJLd
1wVU1JNGl2s8kyfvlZXbE6HKhmXeCWV1VAOCpkAGQcg5rDFZLRr0sRRr06eIoVIteyrU4VaFay5m
lCTadpNOC5ZTj73M4yckc0cxVSNSMoxqQbUZxcU7Qm5WjUpydrSUWpRleLbs+ZO7+qfA37V7QWtv
p3xC0ISyyYjbxBpqRopG8KJLnTmdlZlZyZJLR4gq7Ntm7Id31F4H8b6RryT3PhzVLDWNP2pIfKk3
mMyFzsmgYiW2lVlUtFKiNhg2wplq/I3UIlCmFSxTLOkkJkcDllILswEZYfKC3yEggPuUkv8ADms6
v4XvF1LQdRvNLv1kKfabe8+zXAHYeaZDvhZWCsknyFchgUBZvyPN/C7D4yv9YyWX1GtSfO8FOc6m
FqO01anKcZVKMrttpyqUrcnIoxcmeDjuG8oxcakqM3gKlRqPtY0pTwjmnN2lRTvTW3vU2lGzfs5N
WP3JTXp9q5jtidq5JLgn73ONpwTg5GTjjk4or8rov2hvi1HFHH/bgbYiJubS9Kdm2hxuLrbYcnbk
sOGO0gcmivA/4htxl/0LodNsXgbPba9a+tk1dX95XV1K/wA3/qTib/8AI2ya11r9ZxS0vHW31LTa
9vRO/K2fhENSPnO8l3G4Uq6KjyDDYZmABfcpxgbGPUsGLMGB6zSvGsOmxRxPY3F6XYbVDOURwTs2
HcThzyOOTuDFzkjiNIstMiDJLOFuQ2VinIMci/OAE3IRu+U/IXyPlyrdD6jZ3WjNbpbPZwwgBGee
TZtdgSQvlrH8pGFBZSOCN4YMSfOxGDwEaM6eMhUrxly3iqzi6bi3JNypTjOyUbOMbxTbu5NM/wBD
8vxmb168Xl8qODlC15OiqrqSvNLk9pSkk/d+1JWi0/esjp7W/urxHupbb7Jp7ATAXlwYm3bQzbYy
ZCOdxCq+05LAYwpzLXxHFqVw0fh2IzPHKy+dcKzWoIEoYI4YMy/MQp+VtpGSzAsLN3bLq0VnZ6c8
VnaQyt9rG+SRpI1JGUBDEqzDHDAhSFCMQa6rR7TSvD9uHso45WIORHA+0ncctuZMK3IJYnaGYnAD
NXy/t8joVI+2oUqsof7tGlUxXsqN3e+IhKpUVSTStBLZO85NtI++pYPiLG0ZqOIrUFy2xFevSw16
s5q6hQTp02oxu+aaimny8jupM5eQ+JzDLEsdu8xdkVhD8oOX/dEMhGFGSjNH8pIBZiNhmtNL8bNA
YheWUMQUsZ5IxvQqeUCxxqDnOSCrDBOcDJr0a31D7SxlitjHkqCzoEjOOGCMu3gEAjeME/IfmHPQ
2s1uls5MCfat33/NCwsORsZCrKQSMqR+8T5eSuQxisVhcXT9nHBYWKcrRl7NOVJOSUJVHGrUjCCm
0pKNm42ai2pX2yzLcVgZy58bjJTkkpKNWShNJvn5FJRbk7atS7Lnaevlmmf8JLYSSomuXNy5MbiK
S2UW6EbhIY2XgiQDJjcAZZcEspauzTQNZ1S2N1Nrl8AxRWS1SGAI65yobaXXliVJYgjv8tdHEk15
GzHb95FaKNI9vykrgyAhm2n5icAnjGRir1vbwwrLFJePFgI6rAJVUHLDiQ/Md20b9o3cZ3gjnw/b
4jFQWFhQwU40ZSVOr9Uj7VP3lJQnyQqOndaKSnzPlV+Ztv6COHweEVTETr46Mq3J7SE8ZUjBtydu
aMpyhG7erSSSlO6dnfnLfwVpkloVuWuHvg6Y88uYJ4sTF5HkE2Ek81Y1CC3+fdNI0oZVD02+FUKs
L60VVdlQuLC5mjki2+YFLfvUZZNgDZZW3NjDNsUt6JZ2dpeR4kub9/LcSJ5blN74c/ejRHHzdB1X
JJKnCn0HRpdOuh5UumQ2ryRRws0l9lpgof8AetGjsCcct5mZQMozFtzVvgJ4W2Iw2IzGth8bN0oY
ONGnVhzw9r+8lKlKTpOMVFQUZtXjNqM3KMomGLqTX1edLLKGJwbdaWMeIqU3Gm4RSpxhU5o1eapJ
c0ZUozs6c1Uiou78HsfC2qu32Wz8Sa8GMbAwtPHcsM8cefE42A/NtjwT8zFmADL3+i/DnU3aMXWt
a1PcJIJfLe6MkGASwYIEEa/N8xRkYgkKzMBXp1ta6TZMDaLYxqJVc3NqwkPVxgALn5scrkAAjcMN
k93p+vQ2cKKsivvCMyopEyjJDK6hSpJXdkqeVYMr7QGPRCpisFjalGtmV3SlCdJUcDhZ4iEJuN+e
rerLrGMoc3JaS5k4pwFUw+VYrDRrUcunblSrU8RjMV7Ccrv+HBVLK1/dqWi90tWmcrb+CkuLUrfR
SXCK65aeRozjLKWdkeNsMpY8Y4JO0EgnodG8GaBo06XFhfX+kPne8FnqF1JESSQ/+jymaKVJAVyW
iBOCchhW1JqdmxeW4F3bwMgYBUSSFkLFQA3mgpIWYndgqCT0OMynV9MTy40sJXj8ncLiYJEXIZyg
LRM0rA5ON2CoO0DBye+eb5rgoVKmIrutQrypU+d08LSoqLqTi7U3zJS5qd7uMWlbSTSv5ayTKcZF
8mHp06+G5qtO3t5VItO9ue/NZLT4nrZtu7a2PJ0QJltSuJp1UDe9xMrM5LOoVY3jO5iuxuNnAUsY
wAcm8S6inilsrnVEkQMTm/ufJkXJ+/vuljdUVR5fmo3lqxCMpLZvaJqmk3U80Jhh6qwQ25E6gEhm
UNGhcrwAz5PzBnJVQT1d3oVleMv726MikLsQhIlRs43AF4mb5cAkbtuQWKICXXxeKxOIpSpVqkZw
hL2WHheMqzinek3GUW5VoxSk+XkUHNKSaseXDB4GlCqpRjKnJpTqyvaDvJKUuabaXNdWTcr30a5m
cDb/ANtzTrNJrt7DCWZJT9oWeDyyH8siKRXQ46ELucuwJA3IRqXH9qWkUBgP9sQSzLHciUWtpeRw
NI2+W0kNoYnJAbMb/wBxQk0cpeWrq+G5mcxxw3CRROCrJtmZwWlXBQERLggsCyEgdQwLk9HDoGqW
7wm+spPscTRsshI8rarMWKxocR7uoXfzwp6nPo5dnWcTnF18DVapLktVoOTjCM3+8i1yqLp3v7Sc
oxbunGzTODHZRljShSxapTqRhKPs60oRlP37050XKcWppJ2tzWv711zSxm12zsVs7PVtPvrKxlzG
t7LAs9qjySFVF3Pa+b9n3lgryzqkZ4zKpLA7N3o0VhFNeWMEFzAoZ54mmLQPEUJMqLE37plCna6j
dtB4Khs39Wl067sZdOjtIATuUTXMIkSQfMGR4FzvVgR8rgbCEJ3BmrznTL/xNoEMyW3huC9txOVh
bT70Wsc4ZpS5a0vYXaBkA4C3Eok4+65cV9vgc6lgaka9HF062HcqCrUY16ULyqa1UlVnCUqtLms6
acuf3eWTUT4rG5VDMFXw+Iw9WjXjCcaFT2M6klGm5cjc6SqP2VVJuMnFOycZRUtV3kUdrcWbSWUN
sssaxCZLacuDlCUI81+Cq4PLFmzwSwTPj3ifTROvmWm43AuZFYxArGqqVBXbKzMjFWYxFW8tiVCh
nArVvfFi2BvZv+EX1PT3uI1dXRLaW1nmUyH7OrxOAkhKkKjhUZjlJAgJrmU8eaUz2UmraZqmgwEA
S3N7bo8LTlymGCySOkbtGQrMowWyRk4P2WBznL8TUnV9pGS503y1KPP7Rc3LekqqqOHK4puKcX7l
ndzv8bj8px1GmqEacYJRTTqUsS6fsk3HTEez9nGr2jOTaTtJ3vI5G+vdWs5PJ02aaztzbrbTXE6S
TSGeZpl3s4BaJn/5ZnfHGWWQKu4TAbWgzavZX0M89hNOVjQXFwl+MOFLhbghHbJX5so0ZLBmTfhw
B0yLoSPfeILW+tJ7KdEjlkLAkLuYSReS+VKuQDskBI+c7GODWY2oWGq3zWekXFvvt4y0Elur/wCk
JkEQyOjmMybDJHEVSMA/uZQxVGr6zLZUq+FxFOh7KKxFKXtJ1lUcFKFSbU4zjJyjJ2UoKpaMZNxc
pOUm/wAxzzDSw+Op1cXKq5UK9H6rRw0oSlyS5FrTqKUKkbqTqSgnPkb928Wzq7i6vtSjtpIt0sJY
mNcM771ldXhjkCosxDhcEs7E4UbpCcxJbz/av9NtoWjCtHsbyYJ0IaUEMojc+YCMhnO5Tgk7iQcu
w0OyaVmEMgilQN++37GlDP8AMqh1kicncrKwK52sEGMnurXwvpF1FFJdiyvFPmRG2vkQEsVClHDs
2SFKlHUq6sFkV1ZQ9cFWnWw8eRThK9nzQTnopNP3XNNWSXLdL4lq2pNVSrwxMpSjBXSuqbqezjo5
XUnyT5rL4ujsuzM+K1sWVQkrxkKVVBHGXBUtldyuBtO4twCQCQPmDZitbawtd0ZSSKbLSAokZYgl
+AxdMocAqTkrhRjIzT5vCuo2cAtrATWqwkrCrsLiLaOQDNcAuyoFUIwkdtvzSM2TWDe6DqjY8/UB
HLHIpLrNKJkGW3Y3Dy0hcD70G7A2gZQPnfBfXOWdKrUpy1TpRlTqqfs253d20lV3UWrx0a5Uk2eL
mU6VOv7WGGqprlUpU505U5NXvZJL3L9eVXvBt2bMLW7ODUpCbe6Y3Eflh0VGMgwXwzeYVVm28Fcn
joGXONRdO8iMNeXBvJQI0ixHFCjRruIBj3hmwcg885DcGtaPQrPyoz5gaRyftCrKPMZl3hmSRgFA
kADIFBU/vFUgkKdldHje2KybbhUHlvBLGwnVcuo+YjEsZUbt6OQThduRk/V0a9D6pSo0+WlUSvVb
bnC/NUUpPnfxzk4ylvJPlXwRcX8csNiJ4zF4qteVKUoqjCnaF0m1yySi+ZR5b811e61d2jhQPsYd
ZLMzJIASEZcpw2CPmdzgEYV1YYAydvzVjTW9oXe4S9ghCttNvdgIpZ2c7T5kjEj73EfRsuFRVIPZ
z6RZ2nn+XHIofbsm8yU7NrMFHlOSXBI2gkq2QcEorhs6fTtOuv3120kU21ckbGikeMsFZoiu7OxS
sgC7stuUEgsapUEryoRWKcZXnDm5Zp7R1ts3y2STWkldNIUqk4v2GIccPJq9Ko6blTtZpK7mvevr
JPl0a1fKr8QbiEFlWBioOFK3K7SA0mCv+kDghcjjpjgHGSujFhaf3tPfp84nkAbl/mxs4DcEZ5HP
U7qK9WMpWV8u1tH/AJiKnlf/AJdeS/8AJe6v5nJC7/4Uae//AEDvX3pf9PX5PrpNa9X+W0GnWtvc
mC88st5ixSrPG6YmQyqUlbGEZTuV96oyMsgbDKcX7rGntGjx2hjmdo4gVdwwXzG+SbaoAGQR82SC
MDA3GrfWniDUbv7RqFmjSN5YaeCaNSSmI1UQzEPjZ0X7pAEeMFidG2sLq2dXjXW7tVAbyCYnteCV
AXzwdjYDEDd/eUMSDX8lY/C0KlGry4qnCK5uSrUlRcITU5JRmnJtu2s2nZJvS7sf3bk+Y4nD1nJ4
So3DkjUhCNaNRQTfO4xUJc1uVJW0bfK+bmZt6OkcWZZLzasqLlPLJMTAksMo7bQCcA4HmcsSCQK6
PT73S0nkgS6nuY8ncsjOsfmFnwzsAU2kIFywOCSWUsecrTNIv5Q8rabcvbyld8DXMCGMAsPkKuEw
QAzA5ZTkDcGArWi0g20ky2mkxKAFaQTXz72U5yUCZ3ODjKZCsNv73JZX+cwWQU8XXxEauNw9SnCm
otYdUotyXNabrTqxlyp2cdNU2lZuUj7DHcS4vCYOE6OCxVOU6sLyxqqzjGPNOVo06dNr3+W2rXKm
5c0mkjo2vdOltEkKxQr5ihbYTzMxHmNkgtIGwpw4WTCHcVBUAqdGK60IMyyagbklAfslql3dtncf
lliijl8p/mwuHKnDEEnLHM8Oz21xdXCS+HHt1RFXz5LVwSQ7h2RwjA7geGDggA5GWDj0Kwv9G0Oe
P7RpN9uuG+SS0slmiHBYFpQJCQQMfu23DcxwCpNddDKMLhLYeHtcRJWhVj7einKU+RRsoqbVlJRk
4X1acveUmc0+IMbXjGpL6rh3KEeWX1fE1uVKTU5csq0OW6WnOlFK7vKycoLNpbLdd6Vpd6RNGYWS
5FusDKQ2PMgdZcOjbTCxj3IdsiyJMisMHWfEt5oNqbnVUs+pMMW6OKZB5mwqrQrM8oK/MCQXVjtL
AACu2u/GmgCFhHaXpuWYIbeC2ll2hmkQl2Kjy1IxhnAVSdpYgbjCZtI1i3cN4dlug8YBW50prp48
eZuG9o2WMY/1bo52DBVlIYVxQo5ZgYVq1bJcTTpXap8uMnrLnfvQcqvNGnKVOPMoQjaU5cs5OLRt
LGZjmSjQoZ7Rqawly/UofC73UvZwV0naynOpyppTSaTedoPi7T30z+2X1OwiikRSqNDM2/YSro0b
yLJuyxXIx/CSxJAPX6b4q0O+MVzam98uZRgw2LMrSByP+WpRkWViSjsccryVYNXPtpWpWtmItB0C
1lyy4W4kRYEX5ywmigXdG+3ABfcpP8ThWI7fQdG1+6014ZbXT7S6jRcCyjMiq7bw2+OZ0Vyj/vEE
ZyBuOSpIHlUI5bWrSnPCzpzqKNr4z2dTlpqcrqpTp1KsYpNzcpcycknZyTR61WeY0qXsqeJp1YU1
HnisBVlFSblGzlOqqPM3G7ioxtdJtq4ad4tncy2Ok+GZSzyZeS/ZIoyeVLpvkXcOCxjRsCNkKhgv
N3UdQ8WokEmmWWmOZPlcSeYohA+9zI6LvUbQAw+7kCTI3DKm8KeN7afzLa8t76ZWMgtI4DFHeIpP
ynbE7QFgQC2Cu7GTkbz0ttf6jJGllq3h2TR75I1VrQRSX1ncIZCitHeRtIhdhncjkMq4JhTJJyzB
Tw1Ovi8DleAxeGUo06k51cbisS6k5uLnSXuxlCMffm7unO7kpKS5X05bOVecMLjMyxeDxU4uUIxo
YSjRdKneVtVUklUd1DVT0s4q13zdtf8Ai83xbVbqzaFVjRbK0lVptzlsSrDcQERp8ikmJ2bdzhyy
k+xWTIGtYpS8hmjVRE5PmOecYdkCbgdoIK5ILbGLDNedR+D7+y1abWrTVrzT4WiUXdpdaTPdoYlY
ti1hVIpUOFTcVmYlvKYkovPoemanp72YP23VYZp2Eaebb/YIGCSFDL5JhnmgB4/eM4JBGSuRXUsk
qZpOg6tXC0qEaUJSg6dT28ndyqQjQmnTlGk04twq883apaDXK+N55TyuOOp0oYutX9pONOUp0JUV
yuUYy9opqonKNpOEoNKVo81uZm0trqMs4k05LiySJkE6whGd/wB44kJlkjZgDGuSAIxvz8wBAr0v
Tbu2jSOwjmk86d8b5Zrd5WcFwmV88gKDhQxAIjXDOWQgeAXOv+KtHa9WK8fxDHONtpbm8RhbZkkC
qjCCO4ICbcq7lyWPy7R5hTw9F8SNX1GK5Gnx6daq6SujyxFgqh28yOUzJLJuJwRICyEkBXeP5vsn
wvTjTipV8NCjiHSjQi8QqbqczfLPkglW9tTfL704px15ZyTd/kIcVqpObjhsZXq0ef6zKOElNwkp
NKDm5Om1NpNKEm3BNKMUj6r/ALSSwh8tWiWZ9rTSFfvhWk2qZEYhTnbgKcKM4bguMi+8TuRIpurO
W2C5DNMjQxNlwhIJWQqSqq5VhyzbiyDjwbxJJ4mvE1G1s73WLa7jhTFxDds8GBnIW3RwpQMPmVVZ
mR1IztYjgX1rxhY2v9n/AGixuJo4maY3dtcXVwHXcS0Usk7OGcqjLE/Ks55ZQwPu5LkcsLKTWJw8
lG9DmrzcKbXK3z1JOLvGThvbn5pSfIrtniZpn0KiftcLi4NwVaKoUuaqp88l7JQU1L2iV5e9dNN2
k3GR9EzatOscm/yJUlUFZ1Z1AGWAYF22yIwChfmyMLlixIMSNc28xLQzINqviVWEbRkElh8uQ3JD
qclDg8gHPzLL4y8RXemwxRu6zwGVJJGlwpRGx/qQAsZG4ERttCDaGO0qxls/Fvi25uk/stfOnhKR
TyRXUz20kW8sGmtrpjHDnYyNwCq7ljkdipr6rBcE0Xh6tbELDujOSnKLalClyzqS9pTrJxlHmctL
L2lpxUk2tfisbx5OWNhhsJTxEsTyRjTqxVT2km2lyToe83J2i5Ko/ZqV5c6UWz6Qj1WATTQxzxOp
EazW0rtKgwXOPKceS4bPDBCocqSwkUqY9STwtrUJsbnTA7To6zAQs0BjAcqSyx4SQj5lkCuSF3by
EUVx0VvJb2qahe74JpZFkMIiYFy4kfyo1AIHmbSY2ViGB+9xmrWmaxriPM9lpctjaIAZZbmCZpXy
5G5Rny4/kBbepbG8p5gwCcqfDjpRdTLXGNOyg68akIyjy+1b/iR51JJNJO8mpJqbjdnRU4pw8W6G
YxqSqtvmo1aE+WejtzOjKVNxvZptxb0XLdTZTh8D6La2MvlWV0AtyID5t9dmFo5HmYTAS3DLgAll
Rd2BsVAxabNmLRdP0+Q20UIhaLlXgi2S4LE5LSKFbI5BGemDwRnrWb7RpTyC8lKu5byVjk2rIoYL
MIyMMynaGdACuTmUgBjmpDfagIonEr+SCwcwOWbAbIkKsQysvGGbOcbm3YeuOm8Zg+SKx1eMU0nG
vUpWiozV4uEFZye8PhWs+ZtXk7xX1DGwdWOX0G5KLhKlSklfkinyyld8j5NW/eScUnomadlp8Mm2
Rb8Rs3/PSREQ3ILD5mcbUMnDt8wK5OFJzXQQIZozGtpFFd2/+sjLvvlWPH72NWkZHdkXJaLJ5Uor
KwrD07SUMksVxErQOqo2/wAxTG7+aY5UdQHiIKnI+bJzlthAGwZIrKGPZ5u2GWOO2u+WTG5xtMw+
Ta3IYn92MkAE7wfpKFerUjCpDnlFxcak5Nb3vzOD1jtzRSb1ly3bjc+ErUcPFzp1oRp1OaTpOKcl
y87UYp2vZLe+uz5OZXNy2vo1Typ7ZtxAYFnJlVF3LgR71J4+765UHLLzyviDQ7PVrgTxT3GGULJE
jvGcRnJzuR+RjJw3AYhgSqmu5XTobqMXIZY7rykYxZTY/DlXRw7qysTnaDgYTcygc5lvZzTi6iml
hhi3mPcMyNkZK7QcANuIDlXySCA5wxH3WRYL20fbSquEIxg/a1U3CEXooqK1kpX+FP8AmvdLX834
lxEadR4WNGWJ5tqFOShNuDm+Zyb5IxvZau681JnEy6bFBaB7eaSRrbYrQqVecgHaN7fIXK4yGfB5
wW5C1QXxQYlYXG+AqVgMkkMkc+cuqxyjMkUiBedx5ClAXwvPYy6R9mVlR5Uh4Z3iifewzw25pCQp
PRVZgc/K7FeZLdIngnisYIBJgeYby1gfzAC6ljIzMwAP91t6klkDbTn1sTTwEa0qMa0MRiZwUpcj
sk1N2lOnJLki1pZc8tU0m4pv5zCzzOeFdSdOphaNPkUadRRqTtzVOb2c6c5Tq2Sbu3Fe+ldrnPOJ
dQu5kM0MIKSFAJ3LiAZdiNoVdxBJGA2MkAAmrF1a2eqQJHJE9tMEjEkmnyzixd4wQkshuDJcQmUZ
85EuGicuxgjgjVFrevtL1K1jlP7hiQHSNVDRlS7KSrEIwRgvAJzgBOCAx5+dkaCV4pws4P7yHc6y
CYE5jjmRR5kYIyHVSCWQOeSRyYWjmNLnlTVOmrpO6pVJcslJXiuaTutHq1JKW9mdOIlltWMFWlWr
SjZ04S9rRjKUbv34tKMuitNTTurKVk3QXw7YKoUSx4UKOLmPHBkHG9t+Pl/j+fldxLKSSs8Qaiw3
eUBuAOPIl4zv9IsenTjkY4C0V2qji2v94rdPtev99+XV9dW1JrnVbBqy/s+jbT+bZW/6c+v9Wt+d
Lm9W4PmxKIk2YKtFuEgdyvASRgDnPmZyOBwwAPQ6Zfx3EbRXMM4L5IysrFmy2RGxVWViVyATghmJ
IIyfMvK8X2V3ataXhulGEdbprZXmjQt5hZktQTlfmYqv3coEIy1dnceLtV021iaPw5Hcz/uz5cRm
u/MY5JcLFBCEZQincx+U7S5DECv5TxmDjXrQwlOng8RK8L06WKhGUEnNuVSGIoxi6k42cLqbavZt
Oz/tLCZtXw9Orja08Zh46RlVrYF1ITUpNe5LDTqPkjKMeZKUYptae62/TdDsYLlZBdPNZQQM2Jbv
ywWbJwwVJMnJOD5qLuUYThSa6FNV0+yY2enadbziZHDalckIpOSf3cilnAJGAjDByp3EBxXk2ifE
m01KS4gu/D+si8txho47F/3g+ZghQGRsdcOyldu0kktz11pdSaiUMfha+kj370imuFgWFuWDMvzl
nXbndsaRUJBCgFa+a/e4HG1q1XAV8DCnCUaf+00pRcedJua9pF1LRfKop8lpWcW7s+hhi6OYYGks
NmdDMVKcPaKGFrKpdTn7ri4VJU7OP8inJpu9ryfrmn6XClnBd6jq1lDBNnyTI0LhQN4YKfNRjwp3
Luyh3bVALZlSfQJb37AdXtZHh+YxLu+ztFk/OJtrQBjhWZUmc9MgKCx4mz0PW9U8tptEhs7dSNks
qG5aNCflIDsFZTtwCtsCG2MQoy562PwPpsphhuLgYQgzCKSSAt87Fi8Kom3hidoKrtK4U4Vq8POs
xwjU6tCfuuNK8sOliWqjS96boQdOCjLaDcdYuLbmnf6HKaONpU1SqU43dSTpyxPPhocicuRctabq
zvspqDUrtKMUy8mr+CbW+8q4ntDecg3E08TrGil9rczgKg2kBo97qA4YhQAMy4+IPhWW8n06w1LS
0kQlTOWj8pm3srbJgjI0mduVbIwWG8nex23+HmiSSBWsIprRCu+4kghkjhaINskZnjY5fOG8zEZB
GckjNub4S+HNRhktri1CWsuZI5dMgt4ZRuZwfnVJTtAAyvMeGU53DfXdgMPw/iLUqlfOYzlQp+0q
1Iwmoe0u1XVCS5owsvepKacl7NucZRkznxmL4kw7rfVaGS+zU0404OvCUqcU2qTlayrTs7TasnJv
7LRSs7i7vHQWF5aiQOGRIXjdZkbIGfM8zC4IUFVG0kliTuauw0PXr7T4Ly3utOv7+ZGPlzW8entb
Km9/3XnxukobgsMo6rllZwH3VycnwI/seNToXiS40yxLtIZ5C09+zSEOMhRaKXQqqty6FGwCxIaq
moeCviAFEWkeO7qSNXTer2WmW8UsYZAZWgW0WR/lGXiN0ZOSQ7ugz7M+H8jwmEpYWhnmXV3V/wCX
lWlVweIpxlKo3OpOnGtBRd1FJKbt7rTTseTheIs9nOtXxOQ5hQ9i4qNGlUw+Mwld3mr0fa1MNJtO
yvKMXbl1bbS9VtPFcUkYnhilj8whJYxHJFeRsHIADEIXVwcYKsQAGHI51xrDq8dx9ibY2BPbSS4k
kBLqskcqw71LhUdWOcPhDkjB8Nh8J+O4r2WeHxvaRNFAIoQ+hRM8L7mVwI0J3LuO/e7OxHIdVElW
YtS8feHRdT6tY6JqtlaxB31q5uF0u5nKSP5q21nNPIfN2qu14/3TZK4LAilh+Cszxk4YXA5jk+Jw
tPknh8PHMq9WVZOT5o6ww/K7Ss4u6muZcqjG6VbjnA4WjVq4/Ls4wVaT9nWxUsBQhTpJOpqpRrYl
8uqadlyOzum7HuB124gZ5LfTbXa0ayQWlxO0k7YMgdJfkQEEqdrAAF2YMV2jL4PETPZNd3OixW7k
yApFclgYh5gycxgRg7doJUkqAQA0gxwng7xdF4xvFisdKtrALE01zcG4a7kaQNh40iMUQzIeSCWd
RhpFcEsO51FLm5RrTyYNLj3FBcXIxIwRmZnSFGBJcBSoL43eXjduZ6Hwo5Zp9Rx2GoSxFJqc/Y1Z
UZUKmiUIqlKXO0tWuaV7rVQSbb4lovKVj8Fi68qFWLhTnWpwmq7TlrJVqcdZOPLzuy3+Oau+t025
0m/sIRb2Vut9OV8jdAm0li+4EhVKjaNrD7rHAKuo56yxhOn2Hk3MMUV1cSFIUKnaY1UqBAEYqrg5
IDYONqlNxyPGdI07+x2e4s7rWNbnVwiWcSLBC7A/wb3iSJSERyATu54ZirVUvPGN5qWqPban4U8U
2zWtyGSXT72W4tNyRqxSVJLmIZIGAkMRGd4ICuXr6nB8JY/ByqYqriI42ph4SjSxEuVVPZz5v3fs
Z14TlOEbqLlR1dpxqSkqh87W4wwNZxwscFLD/WKkJzpxVTllLndpOtRoTpctSSjJ3qqS1jO1tfV7
7w/ZyM19cSGERqFeRZEtlDHejfOy5VmB4O4qCDwSWeuJn+HOj31+1++oXUreUFKxXCKzIwb5XuIl
UFmGdm19+0MFyoapZ/E9lcaZdNJpfiGVIGV3sodPEt4u15GDK8k+x1ZTvUkvjjzCmVauPsfEnhjx
DdSfZbDXdH1Kwu0VfOis7e5doxIAs9vI+Srx8NC27nG9Ayhj9Bl+R4y869WpV9nTXLNqlSlGDqJx
pSm4ynKk4zTfNNS5o+6lGaTPIx+f5dXqUKMaNB1JuMqcZ168ZzUJp1PZ0pQhTqyUU9OeLWjlJx5u
bq9S+Hum2Jgu7K0uby5WE7Q0kckcpcOkfmCeNi23ja6uGXcpyxZmrxyebxP4TvruKbR3slaWR45Z
tNtZIwrPIRFJJLEXihlU/KY5AmGUwsduR9BaZr1je2Qivt9syH7OUuoybklDgM5jR0jU5G54ZSrD
eQuCa6+z8Oafr1q80tzA0bIYIreSWWRDE2V/ewKrrKhUfKJiUZWDKWy+PZynNcfgqdXBZnhMZi8J
GpC9aMrRov2ln7KdSK54uN3T967T5UkpSa8fO8iy7H4iOZ5TjMLhcfGDjZpyWIjZ2VWlF3Uo2ipS
tpo+bmi3L570zWGeGyOvyxQqqma3We6C2Yj+VldYXlV8O2C6l8KwUhTGcjutO8RWUm+JtRUQz4Eb
2lzAFzhsBFVpN5wpMkaM6txlSquS7xV4G8Ladb3lzPYvdTWsZfT0gNpDFFKC4kEayLlNz7SfKdCw
YByykiuU8I+CdPFtcawEuDeXe4vp7mNI7U7iI3g+VkljyCUkiImj4yARvP1ywdCOCqY116nsq9pY
aH1eKlaM5N80ud3aSUZVNldPlbvF/nNTNK1bM/7K9hSlXwsV9cnHFpxk5QjJaKCablFclPdpu0kv
ePc9A00tp6yyM/kSSPOg2S3CSIdy/OEhiZC3bbkbcMPmBAsND5xaBPMtrNGUQtaJC0gckndMHLTF
MYBf5iAY9gYeYDW0i5Nvp9jHDOszw+YJoI5GMxV3clQGYF12qc4YuDyVwu6u3sbPTngYTWt9bXCE
TxzLBbtDLCd5aNna5Ekcq/KSqKxZVYgqQXb5rEUfaVaiVSm5unFv2slDniouUIvnlZuSb5GnvdaN
WPpsBiIrDxfvwhCo1GME6jUm2rw5VfRNXbu7XbslY5+WwjtXgaCW6fHlfaoZvKeMowcNOrxy7geh
dEVgwZflUBmbAvtVtbG7+wQRwXV1cvmOw8xI0kLtId26RkeHftdgvzHcCqqw5r0h2gkkZEQSKi4k
ZTsR1/eBHBaT5GAHzKM5YDD5BavGvE+nPf6oq6beC2RHERMsLJPazPJljHdDBZcBflEiHqDKGAkP
q5Ko1IzpNRUPZ88vec5QqNNKUor4VzW5o3vZuzuuZ/McTVJ4WHtqcHXn7SlGFOKUXUpuqlVdN87b
mo6qTjZc3VQbNyHTNW1C2l8+5ls4EIxb2aNuhcM+FN2GZiAduQpMcgUEquCD0mk3sWn2jreXG+ZC
Fbz4S9rIRvGTli+51UAqzkEAtuZnYDzKO01vwbdSXkepSatdTRICZSfsrxO+WktoFMRlyc4Z2mdS
SjO9dlZXcsix3es2z2l24WSB5o3ht5FYyBSsQH7wlTlt0cZzu3KVYmvpaONxOGp2lUpUIKorxhF0
qFRtuLikm2046xvK9uzs18Z7HDYqtKNLDVHindzqTmqtSEXNpSqTjKSjN/Dy2UVdyblJXfV3N4uo
wSQzQxRwlV2yxyskcioxIEY2ySBiM4UgqSNpyOBg/adNtfNis7dCwIV5ZctEzqx5UmRtrf8APQgo
AxBCDaFLkLSzsRczIjDCysWaE5ZvkSNl+VVYNiUE7TgFirHOs+ledbmT5pBIF3TeTHJGMPICrZh3
A5X5izcnpt27j10sTPG03GnSlObm1GUIwpwUeZK0p3i5NRj7qb1TTvJt35ZUHhJTdStClyxbkpSd
WtJttR5Vdwpxdt4xk9k5J6y87vLi6muGNu4mOQhRGPk8O2Vy4DMr454IznaxC1nLpl5MlyZYooR/
DhAxC5kVmAJIDJ8pJbc20jIAHPbLCLOZoZ/NYMVRI44SyMTIfm2tym5OeBnhQrFycxXiRhZI2jaN
dwLGAFpzESTzGCEKIASxOCoZgXARlronLGUab9kowgo2i5cslF7W0T92ybbcW1JL3nFHFSpYevUf
t3KtKUo25bRTu276u+vLdtPq1a/MzhR4dusf6+4PA5FwFB5fkL5nA64HYYHrRXTGwssnF7fqM8KV
iyozJgczA8ZwcgHgZAyRRXEoVdL42XT7UvK/Xz7d9PdfN2+ww+v+yrRq37uWurXbtFP/ALed72lf
8tI9e8L/AGPzbdY4GEv7uCWUMAQ77ScTT7By5LcgBhkMrVasNat7iaRVsLeT5VZHSWB4d4MgIaQq
pj2spXlNxBbY5wMvCeEVhlW9ltFtnAUAxwzKHDSY3xbOehOccFgwJLcss4fA2VFq9rOJOdyCW23G
M/MGgkYKRloivyls8I2AzH+baeFwVeNWccszFVVRpv2tSlVnRi4NxjGVT2kdZQjFXqc0oJSfNB3v
/WLzDHwqpVMyymVFy5qlOn7OliJzqTlyONOVOanBSTskkmko6t3Ov03XLWCOZrjRbaefmVIbW6mv
JGwvOY7aAiOLcQVyQpYsPlHLVLnxfqtldQ3On2dy11OVEdutoY4IVBdMTCTesm5cAll7kBgWwOh8
O39l5UkGmxRSiAtDNIBCESMs37szRgHjHIZWdWV8sSVFdOLKeS1eHTjaW8lxv3SlASmGZQ3zGQOQ
DuUAbvvDAGGb53EUcvnXnQnlahiVTj7WeIrzhanzNR1aq2c7XsnarDX3rO/0GHWZSwsKsM1jKhKU
nThSwlJyVVXTVoyoqVrJJuDhG97N80n45rnxG8WWMySXlnqlkLlisQsbzZEJd6jZBC8qokbNtbaJ
T5ZJTcqrg+qeEbrxBrcMAuJobKWaAb7vVprO3BUBpE3zFtqyj5gMHcxKjY4wxmi8FWsJkv8AVWPi
MCJYntb22tJbG3lfLecLd5HcI4RRn5ioBMfJKlL34bWWupazXOpSwWULxSR6fpSwJpsMe5jGs0Qj
fy5kYAI7tvjw21MlmPsUJcLyoR9u3g4YdOs54TAz/wBrqQn79LDwSniFC6/eOEbQlzcsUkov51x4
rjXxHL7PGVK/LSowxONhD6vRk5J1KrklQlUjrJU1JtpxTlKTlI9K0DXtJ0SaS2uta1HXb1sI2nR2
3kaMzl1Rd91OspmTYpLSI4iIztRtojPR3Pi6xtCZ0jto5y237HGZfscaEuGBmlkQxSAKNyxx+WSS
cLjNeVaNoNpbtc2J1HV7i2YCOLyHtyx5/wCWdw8Pmq427cbiCMkxlVBptt8NYri9vLyHUL8q4VYb
O5umnhc7m2yKEKGO4ChNzMUTqChDPIfoVRyPiDDPFSq5fRp4enT+rulh61LGRlFSvOusQ4VYJQbm
1OdaU5Pmc1ez4I189yHnwtPDZhi6tVynXcq9OVBRTlaOHUPbR5pPluoqm23yW5oJnoKeMtMu75bU
PJ5jCMRq08UMAdy6kCSWQGRJGUhWjhcENnBUPKPQ4NtxCxmQWqbAT5b20bMw3lWDKqgjIO4RgBuc
BAN5+X9R+GOp6bK00BTVLZrhFhjmN5ZXsGXfKhoHKh1ZzzLII3UySYDhlrtNOi1nQtPmeYMdQhik
QQS3k94rRsXGeHl3yJhBGCmcBiwVWUny8fwfgsTUSwuY4OUKtNL23Ph6ntqlX2iw8cNGFeHs4Qal
N87grNezU5SbPTyvjTG06VSGKynGRnSf7ylKnXisPCnOLrSqTlQl7Sc1fllGbTbanySim/ZbHSkm
Y3EN0qSKreapV3YSZOwnzDhiykHAO4jA35YGte48IaVq1u6a/DHcRnOPtYEce5d5UKjMH3svVlIL
KQu5ggFfNvhbV9X0TWLiXF351+FlMbQ3UCAlpTHI8Uirbz25TASSOEkSFYyWYbj7Rfax4um00Txa
Hf3l0katCZtsNq/zMUkDecI9uVDHJDEsu1nCDdvhOFs14brRjRrfWoVFSlHEzrUsJCtiHBRqLmlO
i6apTaTlJ1I3TlF3lYJcXZLxDhas8TRlQVKc6c8L7CrisRGEZz5JckKdT2sqyV+WEW0vckk0pOf/
AIQPQNNjuI9H0u40iB22FoLrUEMi7yRIh+0SKImY70VSsa/I0Uasd1dYNBgsbSBVWW7SONY2F7cG
RosZ2SCSQeYVB4BkJIOC7MSDXN+FZviFd2E8viI6dBOXQQQ6fZG6e1hZ32faliumTYyjImVgqDIm
TATdW1jwrHG7XviPW9QFvKzxwqkqo0JPmkx26pLBN5MvmBBiOZCGCufncn7fB5fmmOxEsJj8wowd
X2caVHCqpi6uITc4zXNRUabim4e0ftL80VzycVr8lXzLJsDhfr+W5XWnSo8/NVxLo5dh6E4Sm0vZ
4qca6k3JunGnh5dbtScW/SdJj0rSobi9n1WxSOGDZMwubdDFuaXEbJAY3LIyhlEgMyjKo4JkpdAv
fD/iM3DabrGnTz+eyubifAkijLxu3ksFuVfKEiQbo2+V/MKplvHPCPgHS9X1CfypHmsWdIbhbpfN
VLc+YyJucOokk67lGQXIiIJwPo3wt4G8OaCjR6PaRWfmF9zNZxxs0o3486dl864VmBCs/KIQpZQF
UehmnCuW4JYfDTxOKxWKhyOGGkpwpxT54cllL3qiWkXzX5bxspNSOPhzi7NM0WKxjwuBwWCcnGWK
hW9rWc6TTvFqld0IqMpTUrTb0g3JTTY3hqysUlmn1MxRuo/c26HzHXJLxPKSrBJSVCNt6FSQQX3e
Ba3fRy+N7K107Rbi1t4yt1e3Sppxcwh5EKgyRLdoWKMwljWZWOQ52qrV9Hak7wYhEKPdTqqW0EkD
lEdHdC4j3s64y2R8iu6vgkqQuFJ4Lt4ZZdTuZhdX14qi4eVYvJgKkER28YAbCv8AMSRk7IypY5z7
uV5XVy/LPaYeg8AsVCvQpRnKVScpuTpyrzcm0nFS54pRnTc3Dnj7jv5GaZ3hc0zf2E8QsXTwOIwt
fE1aKjThThFOccPFWU5zr6qcXNTjB2u01bM0k219qJsLjTHMcajInhijkmjkJCReYgfKyrh0IWIM
cmMhiyD0ZbOK1tpbewt4bBo1ER2yr5qAeYf9XywyOeEKbiwcEAA5XhuE21yrrdmQxRmKRvL2wAtu
XYgMbMAu3Pm42gEEhVDCptdkvLKK4KNCizF5Hl2yuzZ8xm+cqVTYGLKqgkrkDpg/L0cPjq+O+rYq
N/YV1QoQjBqlyylGEa8qrk7zqLlnzTjezcYqKi2fVt4Ollk8VhXF+2ouvVqSqRdRJc7lT5ItqPKl
ytKbd+ZycmnfifEukafeaXdLeajdTXR/drYSxxQtdNJKyPHBcRW7yQsT80brEFBwchiGpvgvwpba
DDJciznt5jGpaPVryW5DKzt5bNCY4IHcDCbzArlPLjbLxrWH4Mt49U1i71TU9S1WS1sblZbK2itz
N9qYSFlQTyXVuqQMoLF0EhiUD5tx8o+8Tz6frFxGZLea1jgtgHcxSXJlC+YQu3cDl9x+Rg643bCr
l2P3WaYuGDwMMllXvVowvVqQTjGlo3GlOpKaVSOvM5SUkrSvJuKZ+UZHldPMM0xXEawsFSxD9nhK
SlCvOpBTkqmKjThTnKjUnblgqdTmcXZxbkm8kPYTeRFLZxW43eQZYBIsgV/NUoVdWj2oSFYqQSrN
tjDKKu6RbXcU6QX6x3dmsjCK6DzFgwl/dubhSVWQKVLxhCvllTIflethNO0C2hSaCeKR32lI53uD
K4BG9GtwsckEqlPlEhMTq5IYDMhz9RWyiV5rZ3kAwX3b41jZTJkhgxwyEhgXyoySHYMa+NWAnDGR
9vXw1ecoUqtSWDrU66q0pSmoRnKhKSptctpp/vIqzvKMuZfWUsww9bAVXQw2MwlLD1atJRx2CxWD
qQqQnUvUhHFQi6lOV3KFSnz053knJySvPrURi+0StiBYkIDQ71EuAxXbOXyzSjaABlS+3IcgsOL8
PaStql3qF5HOHuZ3khmIk3eW2/HmO7qpBGNocCVWUbPLAUEj1m51uCK21a/iu9Pgn2wK6CJ2ZXZV
JeFPtEqJ95X4YfKxYqDXUfY4rwRlLu+m8rBNkXhhsXCgokLNtNzNkcgMm3naQGBc/XU6NLD4GdGh
KlCX8XFvlftYQu/Z0qbcmp6xvUk5KFuX3m4O/wAPKtVx+N+tYmFWcYRcMA4To+ymptKpWxFOmlKn
7tnRg+aTTndpqJQsdBg1W4u5lBniiDvNcSJKzzEmQFxL5rglGYDzA5OQAWcZeusbSLK40lLeIo7h
dp80R7Bh3+fltm9MDD5yW2khWbdVS1km0xWhWC9SLcJPs1pGZB5mXwq3Kg7g6nBBG7GdyhRuoivN
Qmd7iSzZQ4UIQ0OCu9yu5GY4cAk4PO7+EBs0U1OvCnWxUVDDNxVL2spcjabulSglzxe65na9leSR
zyhRoVq9HBP2mItFV50IJP3no5SfNycjjyqy5ot+87u75qPwwFklnVJkWFgYw8ztFuLspJyzYBwd
qEfKA4yY1UN0NtZPFZmGVpo3wR5cLPJbHO8LJI5QtGcfeVvmB253hTWit9EygXTm1DALNC0bCJyN
20lETYm4YJ+VQOWLZDEW1aRITNbPE8DNjCoQ6gGZR8zoFBfAbKNnaQM5O2vaw3NSo1FQrxmrK1KC
TcVeVpJc14Jav3Iyb2k7e8eNWoQc5VatJxmubmq1N5O7TU243lfldlKWna2/Ix2V6kcyXd5biIMN
kPyMxGZAHWR4zJgKVI3OGH8QyFaqJtrbZMy7Q6r95SclQZN5VAGZiMA4AJJ2tkhgrP1S6n1OY2+n
K0t6km2T7MpbEYaTfvJVtwXbkucBcEZIzTbG2njkkh1WRjIqrtBaLgAyFW8mNFBbJALcD/WE5Jyf
YjR/2alLEzUKU4w96d4Tlok3FS95tva65m72Tep4kaqdepHBwdWpTsnK94LdW5k2lo1ttdXk3qc0
12gZgJLggMQDsi5AaQA4aLdz1wcnnk5XJK7geUo2gkAYAACYwC4GP3vTH6FeScklQsJlv8mMe2vv
6q8tbW6qLf8A4CtWpXn6zmN3++wm6/5eR011/wCX3k1+ezv+UGs+HNH06FtOjNvHgK2DaW4Co29T
IAQGZycgtuVs9WLnNcXc+CvD8Fut/cS3e2MM7TMjvExAbcVhDMuPoeCQGJyRXfWiNqbPeXSXICuU
EcocTMpLYWQSZZQSWyPlOSN65JLbtrpECzTi8WCa1eNdkShiQvJCyKR5e7ON3G0r0JJOP5ClxHXp
YhwVTEYTAQm/aU41qk6laMJSaU4pVJVqs0uWcfgipJJqLcj+zZcO4DF4acnSw9bHVY8sJ+zi1Tcu
ZQnH4VRpRk1JJXd0t1ofKOnySWOr3dy141hppkkMBUm3mlUlwGXMjOnl4QybSwUbTv2nLepeH/HW
3zYo9V8iN8KkqOzAsQwMk3zNL5hYDYxUDO0khdxb1aPwL4auYZ7qG0tBbF1MsUaxxsiglQQjLtZZ
BvXbtLg4AZuCOs0f4c6AB51np8FrFsIM4EdvIfv/ACbkVfMjZTjK4ZWK5dgAG6sVxRkuaunGWFx0
pqPJC1KlBxUJcsVBVOZJa2k4xlyxlzScYxVSXn5Zw5neUqpH61gZUm1OpKU6r5qk5d4uPLGNopfC
3Kzs3K78y07xXqWnQMILPVdbvLiTDyW0E06sjNITKfm+Veu8LuYLubZIgkautHiLUI9Oea30PVbO
YyhpxJbTJJMF3ENDBIyNGeFLSJG8bj51CqrrXqelaXoWkoV0yyPnRxny7qQBxEwLK/lRuzjjlvMJ
3tuIyDuJ6K1t1jxLLawXruodpZ0aRYSNx/dBYy0fy53rHheq8jcKjAZ1kMfdngaso+0UK1WWIxDi
kpJKEqSpqDcpNW9lp7ys5yfPLqxGU59OnKX9o04Q5f3MKWGg5wvaLqQqyqc8nFX5XNNqTi78r18N
sPivcW9k0WoaDNbzEu0NzBp9zcySLvbclzeSRxxs/G0IkUakGMqCQ5bd8I+Lb3xC85i067s1ZyYp
Zg0MrgO4dszsSAysXQfuyqsQmAwZ6vxI0TUbu2uZ9AWJZVmhe4sHkJSdctk20WYHSVseYRuDsrA4
XDNXOeEdW1tJJP7U8PeIoUgQpBa2mnJp1s4XLGSW6uriFdiYBbMqurMUiMh3V9gsqy/FYOWKyzCY
eVWtL2VSgsV7sITm7Sp0q1SFLkajG8mounC95OUWpfKrO8xwObTy/MsdXWHp04VaFWWEqRdVxsp+
1rQjPW8ZXpwac3Je7aLT+ltHtdSkgaOMhBGiuituUyH7uVkkBB6KcZ4X7rM20Nei02SW5kmeA2pQ
Dc8bIApzIWG8IyNGSDmL7uQcHnNeU6J438RSTXtje213pBUQ/Yvs+kTX8clu5c5lvDMv2e5HDxyQ
2vkOGlbzCyIDWTxZrl5JfpYfbGih3LM2qWk6QuVDAvKxuonVVCYa3cMn39jmQha5cFwNndXE0Zyq
Qo4SnGhN0qWLoVanNKryuP7hVfq7lTipJPWNOV1KV7vsxPiFw/DDV6cPaVsR79KdSrgsRRg/Zxcn
UisSsP7eClyupUjLkjLli25NH0NYLpEVp9tjJnki/dyz71aERgsGDRsVEZx8oPzMVYqSQM12Czx3
8MS2ckTB4BHaRW4jRHIkKlnknuCqybR98PGcK3yuxIr47XVLzXbi0XVro3mnWsyxy6bp0dxbW0Yc
kyMIoJQ0q7U3pMZGmVgyrJvUM/0vp9pC2k2sUEVzHZGONrS5eQxlEXfsaIPK87JjhlmCqDnaQ+6v
tsz4bxGQUaGLxDq4pV4Rg0lKtRw0PbQl7OD5rOdoqaqSXPJtKUnaTXznDvFeC4oePw2DnGgsK4OM
JRdPEVrxkpVZKLlGNFTk4RhGpN296ajF2fZaUEsLieG9PmM0ZWawtXjMquGdSXuELRKQQcrvIkUh
iSVV6ZqGmeHdUgaZdLgmUSZe0nLXAhlQTAPFH91MgkGRSTglVywkVWwLp1hp8k0xt4YEiEz3TmIG
dlYFRKZFVpCxXAdH7gPGWAauXtfF1rrU91b6Ja3FobVUMk2IVjl3zPH5lqxRzIV4I8wBirrl8KVb
6ThjCYnGSi8Dho08NTnGcsVXh7KNBuclVlSnKldPkhGTpwk5PZtRbb+V4zx2X4Gm6WYYl1cTX92n
gMNOdepiJWbpxqUISl+75opKpVSjGTXxNyvZ8MahcWvimez0W/3QhEgn08WytOCxwWWZYIsxIVCt
vk83ayj5iVavZ7lry1dZpAieUxGAqTvKDjlGRw6kHG5JEKlgRuVdzHE0nRk0uxjexi33zBjcXcq7
jKHd2PyRKrsGbLKEZkRd+cLmmXVlqsELXQEt1OZEZWjgBwrF9pVGUSxjABy/JDqQu3aKM7xWHlmk
sRVr05+ydNKo1TcX7NqELOELScnGMuXmlKOibu5s6uGsBXoZFHCRw88M63POpGEqqlH23vSipVZu
S5fhTfLF2sknvzviWK5e/g8Q291CFspIXK3F0VnmTzG86FYACIZAn+rXIQsAQWDB12NY1W2msLSW
02o93JHzG08kkYLMWyscXAfBAk5VWyhJG0143ql94gufE91p2o6bC6WKpdEx3Lw+Xbs2VuJYxbze
c0hXmPaiEPiNyyeYe78H+JDryG9ktraK0jea0hea5CywvbyMkkoV2hDqxRihWJydpILBTPX1WY5t
gqGDo1cXRjKrQw9HlrTnyxlSmm6UIw99pX5pPnXNGzSbtK3xuRZDi8bmGPoYPHThh8bWqJ4WVGTm
sRRqThicVPSElOVPkgqcHGnOacklLf0ux2W1rI0qwi3kCGRAyJNIy7gZGYDd5ysScOWyCysuCrHw
jx5rMGq+I18MaZcT3cbmJpQGkH2cl5Wj2s11FDyuARuA3AkR7vmPrWseKfB2mabIbi6bVJ0UlrOB
SlzI22TaFSVVaVVcIm6M7uQWIB+bjfCd7omo6mviKTw/e2l1EqrDCY42uWiV5RFJMjXbLICOTiRd
iYIicYNeZkVbLqNLF5xWhTr1W39T5Jxm/bN1L8qlLkik5Xcn/DbtaMrN+rxPhc3q1sLkGAxdXD4e
k6dTHuUY00sDBq/PKNN1XKco8sKSu5JrmUoo6bRNEttP077FAsizyIJAqJDGgm6JLKDllnLKoLbt
rMQwDMmR1fh+LWYLWS3vJLi6jJb9/LBDDc+VvZjDPJbIqTiNSUikaKNwmPMZpWdm6SxuRfXHm26i
N9o2mZBPMiByWAZEVFHyg7ADncTuEqsw6a48x4JILQWjEou8TJKqKVMnKmN04LN1CsTvIZSoCt8x
jcK8b7aqvaVHNqdSpUbqSlUc5twpzjNqUYu9+aq00/JM+ny+rSwcaa/d0Ixpxp06NKHsYqEU+WrN
OnSlGUuX4Y00l7q1umcLqSHU445IzaoLCFYtiw2lozxJJM8j3F6ixrO0QLHz76ZrnytkC7o4o1GV
cWcGrsdPZr1bbykee4sRH5cmHKtE00q7mYjhWICHgh/4Rc8T+HBLYEyXK/abuMJDZadI5JkRmb95
bqryeXlfmdSXjUtwq4iqzoVlrOl6Ta2K2+1oFIkhmDwW8iEkRt5bwsqSqMA7lkOAVGcNXoZXl1LC
05VXTnTxGJlCnSlU5dKSjFVKzaTUYWcYxjeCcnH3pJXfzma5rXr16lCMufBYam6tdRTn7as6iUMO
rOSUpRbqTdpyhG/NFc0mRT+EtK+1WC6YGhhjiDXrTRrDuZCxQ/dyZmyC/lKQBl2k3k1sMLG0VZIo
YrjI2rcRoFlbDuCk87IZGGQcDnPHBAVj2um2EEmktN5UVi7gIbxFe7gyolVwqt5ckrE8K6yokbFg
sZjWOOuTXTpJ5mW2u5NStyFEttC8S28nJ/fRxPH9oWRBgSSpmJTlclTXp4/ASqVqc5RpyhRoRdZU
ZSgpyjG96kaiUZqXIrR53PmadndyPFwOLp0sFUpctWlUxeJ5aLqxjUlTp8zUY0qkeV04wu7ScYpX
5eaTSM1Y5rq7FyiPEgKbdkzCF1RmyrMyMzH7pwgYDHzZ5Y9jEiah/ozplkT9zJLGxMiqjkbZyQSC
Rjr5Y+bBwQxns9GWC1ZbZViERGYnA2v8z7iCQQWOfck5O8gbq1IbRIEFzO4Vo8gtu2xbSXyrKxCn
sflw2QAWIDPXJgqWJxtT91TgqcFGKhO/KnKbVqcnKykrNtQs7pvV2v1V/q2X4aanOUqtSTnKcHFP
rZySSk9L2cuaT6NLmOI1KTSoLSU6sRJtJEccaMZDyyrzIGwFYjKksq9FJYtXmEuuX811/Z2nf2hH
pzsVJCyCMbs42qzgunQt5nAABXKbc+n3diutao88cNw1rAdrMGRLduThllV/u53ZA3sCQMHac6h0
+2tHD5h2qI0cxyiUhlZuJAgMhKpnf8oAwDk7gW9/E0aWAVCVKF8bNL2rUnJUVZ3clGSS5lKKTdt3
ezvf5fB1K+bTruVdQwEJWpvkcJ1+WclZTqK3Kmm01fVu8m1JHJ2Hh+20i1h1W+n3XLhjAJAUaRju
G1LZH8wHIUMWO0bckoWArmLmG91K9+0LcNCocLGRHkLudwRJkIVY7jzKzN0UrncW9S1rZcPFBZ2k
MkSRKryyPDJHG7ZBaJgFkXaRkffUZwDIyuw4u90o6VM8twZpF3GSJJmMyclmDRLH8pQ4+UH5gMjI
GTVY7Mq+Glh/3VGv7LllCavOt7RKTnenGd6ajK1nLXSScdJTFl+UUa0MTbEVqPNKPPSkpUqSj7Sa
TjW2m5KzdtU+VNS+IpDQ7k8/2hAc45/0bnmTnmEnn3OemSTk0VF/wkMIJH2qIEHBG2QY5lGMbDjG
OmT3+Y4JJTWeY16+xWtvs1Nrv+91S/GOrbZ1Lh7K1pz13a2vtd7OWuz9fu1vY/Fmw+LH9p3Qi8tN
PNyyCJ5hN55YHBQRoZFXA+ZWZ3VRguoyQO/Pi+ztbVZ9Rv7cBwVSKFxPJO+4/wCtMBdIlbJCMSwz
hskhhXE6T8IILy3Vrh3lt1YGC+u5YhcwqHPzosbRDAIw3nESbQvIYiUekx+B9E0LRBaWdvBfXWVD
XbRo4Zm34kWJmbK7sLKzEOA5JkD+YT+C4/LOCp4mhUozq0Y4dtTpqFGnKUIzaU4ubcU3rJKanK7m
3JTim/23AZnxx9VrU8RQwtSeIguWspSVKFR6pTp0m5STu03eCS0u0pJ8vF41tr69t/tV5b6Np8ZJ
kbzg9zcKrHgExMVwFzgfP8ygkMRn2Dwz480jXZnsNPvPtMMOIvtEjKscgXdxCjgSAEH5mfaCCCck
hj5lN4W8P6TpzajeiGaTeTNaJDDLCGPmAKSImdASrKpYIqjCndyTjaBdeBtJ1eS41O2iF+rwz2+n
2slulkqPukjmFxAJIhLhQPKR9yMAJbZJOtx4ey3HYPMK+Cw+Mo0KcaccHWoxjNudXltKPuQU1Nt+
0nNpU3F2cnGSfPS4lzbLMZg8HmOJwWKqV6nNi/aVqlKnTpRbslKTqQj7Nv3aai5zbcXZWkfYlgsK
IkaJBMt1gx7Z1Dp8zsvlAndKeWJVQcEKuQvFa80Tx5igBt0cKDIQpcSBiXYKCrc99wY7STk8k+OW
3xEF/LHY+GtDt3Cqu/UTvdogS+0xxqzEsBkKRwXZdwYs9egaDa3RjaXW7u7Z5XBi81vNYLk4LISH
EZBzjkbWAOCOfk5cNVsJP/aJ0KeH5qfsadSVJ5lJpPmqSjSvKCnK80pe9FctOLejP0ahxDhsev8A
Y3KtywvKtCNSODjHmkrUqk4xhVcGmpcjsmm7pqSNpNMR9zSS7jGoIuHhRk2hmwvzqSCm7IGcZ3Yw
CxMg0aW/t5hbFmVH3yPKzIssavJ8qyqdigrksoXJyy5+VyZJv7IsmT+1ZHdsB7dItqQTR5cDLGVn
JHyN+7YMGA3ACQipX1F7qOJbOKG2hVCqQphIyBlc7AMuWUnkruPG0hy1fSZdllKilPEJzl7RQtUx
MpWpR5oxdCkptRm1bSXvKy2bu/OxuMqNzVOVOK9m3HkhaUpRd7TlJuXK+rUlpZttXIHa307TUc2s
cVusioyrlYpATLv8whmkeM8qSVKAEbJDlq5jWPGWhRQtZ6LanU9XACJaG1aWzgcGQbZInk/fAbiW
cyZKbCCcAmDWbq00+C+eFHuZihadSAHY/Pgqpb5lUlVy/GSuGx08ZttR1bT7u4uNKgO+Q+ZdtLAs
ZTeWKRm5SNySwBJjkXzSueSDIK/YOEMtpfVsxlThUUm1UhUq1IQq1Vq4SjVdpKL5IpqEWmtZVGpK
/wCJ8b5tVeKyrDynR5ajdHE0YRlWoUk6tny0IO1aq4NuPtE1FpKNNzsd1oHhjxNc+Io9WW/Sykmk
NzLYtZFbe3kMryy2yWwnKPbsMbgQ7r8vl7WKyn7Gsb5NRtktZ47ZZYUG2SNZIIw5Dhy1rM3mBc4z
ukKk5IyRI9fNngO98X6nDLcXL2OnWdvNGYZjbB51UMzPiR5SoUjBG+EKVJPzDeT7TY3KtOkqM13J
IVVHYK0AcO252wuVAIyFPy7sYQZVj4+a4yvXqKnj5U6kKU1y4ePJWj7NyTjKerUJJ83vRs7SSSai
3L6LIMuwOEwk62VxxNFV4RnUqTcqUXUS9k5UklzKM0lJ05XdnqleTOi17wNLr9qkdzqs1tBEiOgj
um8qRCXXAgDMiLgDflGTG3DBt27j/DSaH4Nv7iLU7+6iSKXyESTSn33k0nyqYbtyLdldU3KQxQqG
XIb95Xps+qWemQteapqcVrGIwoidkBuSpb5ViciSaQlwgRMqSVUANgnzeS3sPHmpoxCxRwOrokjO
zPhm/wBZDG+0biMgA52sS5C5ZfscDWl/Y1ShU9pSwM4RvV92MacPdkoQUoySUlD3kvd95XbkuY+G
zLA0pcRxxmF9jVzijJSpwl7Sc5yaUfaVVGad6cJuUL3akoyla1z3/wAPa3pc1mJrcW62x3Eh5wH3
ksI2WElvJygxmM4YAqQQDtgvvGlpppnt2Fm00sLi2adPPVTl2LRtIFUPgExrK4YqD8roGduYkW28
MaNHYWj2984iCrZWixyXALkqWaOVkkgCH5S542q3lyOAFbhbLw7Fq0sdxqN3efa5p8CximSaCAM8
qpmALICgUqHZGMqswZWJUmvn6GWUp82LrYjkpUm/qsIqEJSir80vZwbkqMYp885u8nLVtuy+vxGa
YqjSo5fhKCq4iqovGVa06soQqyVopVHG0q0n8FJaRjra3vi3L+JvFmtTanb6ldpaxWv2H+zp7eOS
K7gDSN58ZzAIwwYCMoSVIB8vd5jPyXi7Sj4YtzLa6nJdXMpRPsM5lEktxIB5QCxosLAtlN0e+SRt
qkK4zX0QdO03w5okkTP9muIYi9t5h/eM772/dKjJJJEGVjsy+1CyOMEsG+FfBZ8SXcXiHUJl/wBG
GYIYYhuMoeRhcNIyAxhwpaPy8sSzkFQVB0pZTh+J51Y5tQqzymhOjKnXc61L677KUlSwtot80fic
1pJQfNdc0orkxGbYnhPDU/7Lq0Fn2OpzU6MKVOu8ujWmpV8RKVR2hKVrRlzOPPaKVSHNKXzt4R8F
6t4gjg1PxBpQk1jzEW0gnjktEKJITGAHubjftGZIpXTgFQsRZRLX0zofgKdogNQKWCQxxlraQqJX
GwjAIaMOQw+8HVyuS+5sM3rq+FEItALSSOV9gXVTMyuSC20NMxiTaSMlCdpyrqobhuim8J2wha6v
9YtI4ISm9bcXV3dFQzbw8jN5UG3O8FFKjL5UA7a8fMsvdHFVI0atbEUPaOMcP7GFCFCkpyUaVKDn
GE1CNkqjheUlzOcpOz9PLs1lUwMFVpUaOLcIOpXdZ4mpiqjSVSvUm7uM6s7zVHmcabfKotRPOLGz
msokhigtIVnXy41Yq7zhCwj2XCPKisxwA5O0kjoduaGuLfWOmXFxFJZ2V4AnkQXVwZ2cEybtsdsr
usp4EZkKJvAWQBR5w9M1mw8P2+nRmzF/fTZGyS0SMSNl34dXctIhPIz8yJglmdcVwYm1S8aVZorb
SLWynjEEb2aPf3DKxKymaQSSB8OSGUx7cqG+QK9fW5VlFRYOlmMm3Qo1IxcJRgrtTi+WKva820pS
lNq/K7xtI+PzniCi8fiMkm6UcbXoc9Fwc41PZ8sk6k5uTfur3lCMee6tZxXMYnhDSLmKae+vbS5m
lvIUc3k7TFYS7MRsV5CgBLlgEIfDEb2ZUY9RHpxjkuLiWeKW2clT5wldgdzFtiqh+XqRu3YP8YO5
qmk1O4klhhuhqbQkhGnmnW1IRGO0rgNGEkBPD+W2MbHAbFdp5lm9laNbadbHc3lu8IE06SIXBEzR
uyJJ0LCX7wJZMjcx78fNqFTFOlTlKr7OCgouXs6UZWvGScoqpa3vJqKvGEW2uY8TKqKc44SNasqW
Gcp2nUlB1as3O6nBxj+7bleMLX0T1d7x6TEZNNuYXgje2ZDKhliCDjeQ0cYXdjIOWRCVbDDcS2eB
0qZE1C436XFBHubyo4/NIcFnIkJjjKO27h9zLHtzmNjwPWLO4cm4UslsIozzMoQk/MCA2WWLf8oy
uCuRkkGuc0W0sn1tppbFIZHd2inFzG8RBLK2FWOIjAO4RyMx3s5UA7TXh08zlOlUg4KMlCfs61aM
eW8JS5YWk3Nyumm5aJX5ZNO79etl8frEbVZ+zbpqpToOfNaTabk1aPKrXUXeTeknK6vvQtaS26Le
rbSjywyGaBUkQhWxEjowMhBy2Du3ZGcnAPnuv6losv2rTku4ZpSDG0F3J5Jj5bD28rMnzErmIBQ6
spZXYgivS9UjtLIGbDyqozum2hM73G5Y85JB2YYEfxckAmvNb3TYNdv1nvYIoYoWDqxgEjSDL/d8
uQFF6k/MxJ2lvm3V7WQOpXoVa+K5ZUaMHNSVoRU1LmioJ66q9kpbSjdNNnhcRKNGrQwWElONatOM
EvZzqN0ruMpVGvgilq3KLaWikpWaraNpDrp/lM0xtsFhELg3EZUsRvJQuuGJOMNgMUG0sSTPLp0z
AQafZWwjOFaZoXIUh5AFKxBcFuSzF1C5JyRuz6B4fsbAx/Z4WjtoGI8mKUZhmYltwkSPlYzjLFFd
sEqsUjjjTuLezsbaS5uITZiJTsW3Y+WjbnAPlyeWrFggOCBwWB3EPiJzq4qqpc7jVrT/AHFOq4tS
jzSUE1HbTkV2rau0pWd3haNLA0uSEaboUIL6xVpKS5VG8pqPO3ZXlzKMZOSTs1zNzfj15cSaErJq
tsLe1VAXmWNmj+8c5wDIpOOGbL9MFmPPn2oa1ba5PPFp1rKtvHscXMSTnzBucH5VTKFgWXoWJ3kk
lTn2u40S/wBclW9uJre8s1D+TauBISu4lXKAEtJlDgDMQ3YBDCuM1c32kwrbWNtAZZ5PssNsRDFE
CzMNxaUuEKnBIduMnOSSRhgcBmtDFzpTpwxdSrUf7+d/ZUm0m1HljJN043lzz5W5NaWixY/H4Kth
ViKeJlhqdOMWqMox9tWak0nZz5oxnolGOsrxu0uZvzkXmkRjyzBbnZhMsYix2mRckmQEk4GSQCSe
gJaitQ/DzxVMWlN7oimU+YUaH5lLtKxVttsy7geu1iuejEYYFe/9Xwi0eJp3Vk/ddrptP7PdLb+9
unFv55ZnmPSjVtpb3Ku11b8Pxc99b/lXrGoWGlwPa24SW4mwsjj55HOXCjcN2zZkFWV84DlVPzGu
esb29uZp4Xu5rcqFTEMbuVHzMokBZoyhGfmb5gCSSW3UW0Gn32+Wa6VWR0d2hj3PIVd9wSQMBnep
QkKw3bcHf1247VJGjhtY7oq0gWS5DgPtLNh3JAjTap6FvmVVATeef5Ew2KVJOMVWaUlUd6cZ1ZOU
rWjJyTjTeiump21bTcZv+ya2CcoyqvTRK0W1C3NJu0UrqT01k2rPRJqTeFLYoLWRZJA7RsGkhQKJ
XILNllIZGVlQkhl3KpAYFPnribDStD8U65Fp8r2ulQrK267DSJczHLIIvKaVFjKOUYFQV+8zZLYr
1OS1sbdJJJ5SUQFZLiMsjMm8gNsVt0km1MvwzAFeCoNeeX/hzTdS1JNS8P34iltivmSRXDRxGXed
xkUW8skDyIPmwSo9DzLX7DwpQqVcDjeaVanjHCEMNzRlUw1J8jm5TUpOmpRablNuUIqb1kudn4xx
ZVo4bMMHKOHw9fLpzTxdOHJSxdZqsoqFOUGqzc0/4UbSnZWcZc0z6C8L6Hpnha0Nhpks91cFwJnm
A82T74dgyoWcY27V3EKq8EsMn0aFLyS3KSLm4dQbVY9zjcobaMB92MZyqqcZO45FeQ+FY5rm6aG3
1F7iSLa8yWxKxSuRhneSWLdMnGGEQBRgCFIIkPscD3LugUwO6NGFKM+yJlZtm08EZKkEM7EgjBXb
k/F5tQx2DxT/ANqpYic5xVTEU4Kb5pSnN0sPL2cFCKSaT9/WT95tKR+lZI8HjMt51gauCo2isPgu
eVH91ByUZV6aqXu73anaTVpzjeTRnPb3KRxahqgkmkjZn8p4fKWGH5lHlxKigq6lmVsMF6YLl6vr
dQ3W1kAt4yiIIQ482XLSASNlRtU4XczBioIUkgmtlo7mMztJIWZY9lwX3SRhZC5EaAnGSOdoXdg5
IZgXryzxB4uXQhLaxZRLoeTGbiATGN2Zk3jcHYRcE71IZM8gSEtXoZLlOJzPEUGsfWw91KpOm4qD
jKndSftItulBpy5rPmulzTi+ZnHneaYXKsvxM/qlOq4xcKftHzRlUqXUFLnk1Np8qipX+LlipW1N
a1iG4afRdNtI77VFm8qQLDujtlBkKtdXsZ2blCkhWkZWIZCdowX+FNJs0ubh7oDUNSjRUkuUESWs
Y37zCiqSJnUlMEKAGT5W4KtY8D6EJWLTXr3P2sh3+yr9ngV2LhWfzAzzbA2CCSAApyG3E/SWl/Da
z0aBbzUJ4bRbhAVD+WLu4R2BJVEBJQYXIO1ipJ4QB6+oxWOxDlUy7LquLqKhTVKVanCovb0lzRlK
piKtSKcHGN3eMYyTk/aTurfKZNk1KLjm+c08OsROarU4T9lJYWXNJwVKlTUnOpy2vKUpTjJpcis2
chomiTahPEyusYZgJo5ICS+8yIrhI5PLbJCgs/zMCepWum8Q6taeE4xaWsIuLhikSsA8FuS3mKeI
0kYOhwuxUKqSqkkOCvXW8GnmNYbSa2sLaE745o0dVkdS2XmmZkEjlU+ZS2/YFBUhc1yWoeHR4l1C
N4ZroW9rKJJr6/2QwP1LR2IRhOyt13b9wb7p2oXOuT0MFgJ0qma1KUcNFSdepJNxlVdObShBPmq6
qKTipXkr2cbSDPcbmmNpV8PklKcsTJU1Rp3hBwoKajNznJOFGMYNyWvNryqcZSSMOPwfD46tYdQ1
me8094po3ESCTz45VYAlAJjK8ezZgFwBHhQpRRXeafp9l4ct1stD0qSaWd1gklESvezv8yhwJ5Il
BJ6ZZjghcMVQVfOuaR4cto4ra3E1/JgRQ21sbqeeZCq7t5DrEMclpWBVAchyAT0Gk3OpzypqOrWZ
upiYzGsuLeKCIlwFASP52VW3gAnado3MWFfRwx1CrUbxrnTwkUpUMMlVcFTjFuNWdKnObUI8q5p1
bw5n7rlKTR4UMJUw1CayylQrZlPlhi8wlKm5+0cpynCNWUFz1HaTjSp2StGU9E06/h7wBFbp9s1I
Xct1eztJIGupvNjEplMcccqQTmIKdpkSVRIx3xO4YeZXotj4c06wlie7u44JbcFUjS2hS4nDtIvI
YKTIVJHmkvhssQQQo2odX06CIraGGCcookuQ80jIMgbVTcFDgj70gY/MSfnXnx7xpqtrbXss1tPL
f6ndRrauZL6ZGjLGQCWCOFolcAFXaAoS+xUC+YSy9WVU8LmuYUopzq06lF+1xNSUYKVBSfJTjCMY
qnQpRjZpXbV7+9JnFmdfGZPltSs4wp1aM41MNg6Uas5e3k5XqycpydbEVak7ylNrluuSLSZ2Oo+G
rXxDeOtrZ3Nw8GZFMk7SvCqs2HYxTfKm/BRPUkCN3VTXqPgq21q2LQxzwafAqrHMTFGjbVJL/Zwq
iYtncGTamzneYyHUcJ8J9F8QW8c1zqWutNiLBshaJHJ5Uu8x+aX3TDYi55CksxVg2N59ogt4LJJJ
fKWFHfe1/NNHAqBnkEgxKrLKCMACPlT5u5ycgd2d5pLBzp4LJvZTwsIqPLKP7uUk5OVRTbdT4nZf
FzL4ZNu58/w5kssVDFZln3t1mGKnGbqSk3Up03UlaivecXZWlK3LaTUWrx5W64tDL5hnury5jiH+
jlA/k+YrSYlZFQhWbKhX3gou3Iypy23S+kUqlvK6Fh5st4pktRuyQQWyp8wKcHGQ+dkjAu4tw6rY
QmRJMXBcAwrGzFJMsyhw/MeOARudSy4C52Makn1WZrcwtLDBD94I0JaRVQud5jMp3gYOSoBxxk4c
nwcJDMMZUVTEeyjUk3Hkg4ycoczcElJuVPV30e1lLlckfV4qrluXwgqcalaEEpTleShG2jcpqKjO
T5btJNbpNu9+b1fOnW8Rs2lnuJ5vKaO2ch4VJ2SNDKgYKoJUAEbQSRuxxXUaPokQ04RSLdxTgGSW
dwrrvlZsBmTeQc4YOx2jLjOAoPnllql7J4inEcbXFoiBVXybdLd8M37xGIYIykbgnyud2PLAAr1R
tRlurUxwwosu3G5Axwx3AeY4G0MDhmBK5B2jpmv0GlTlSwn9jOFFqdONWrLmTXO+WyUbN+4+WTV2
nJTvJrV/meJnSr49cTxlWTpSlg8LS9m4ydBVKs5SlJz/AHnO/c5tLQbjyp3bym8H21zMbku0zRKc
bcSKDuIfzMSHYCRyNgbONzAE56C30zTobN3a4t7a4SNUWOJRHC6ZxtcKgZ/9XxvXAOSrFScRaTpN
+JNwlkJmGCY3woGWxw4UhwfugNuYZKkkOtd6PDVyYC8trb3M6jMK3SxLNyWG2NovLeNTjlMlM7mw
WJLeVXowpJYR1lUhODjUiopXldpKFTm9yzUbW1+G9t5duHr4iu6mOeG9lKMozoylJ3s3K03Cycrx
u7NtPVK75meaahYNLbxeXB5kfBySZkZjnb5aIW+VsbgT8y5K7ju3GxZ6Za29oLq9WSCfDYeNGRVV
d3ADsPLJCZKlByMBSR83oltpTWyyLdrb6e8hBjiSRbyYENJysTuTEpXaQCznJBLjHPEeILmW5eSw
s5HnVMed9oTa0RZ2XCliUdWGdyKGIydikhgfEpZZTr1J4SnTp8kJOVSam5zcVJRlzTbsrX6Pl5nG
7TPXeZywsFjJ1ajqzUYQpypqnF1NeTkgpOST5bpNOahzOySbfKale6bqMsFvFvMEbbTPI8iMXDOB
8sSn5X4wHKc4L5qywtbaP7Mtmzq6DE0saIXY7sjJQvtH8IJ3YIyMICb+n6NBYWzTXKwvPJnY/wBn
k86LDDhJivTcCxG1WXcSQwLEathYW813umuZH8zlSjKy4JOGkyu5QNnynfgcK/BGe7EYPFyoRp4O
Elh8PFcyjOMPbJOyioKS1vB3km7qTs3ynLhsdQjWqSxdWnPE4ucJRjJSbgnKWrqcsnZLmbv7zdkm
2nfmrKNNPbbIivKcyCIuNoXcduGAwrYKhkPzABlUkAsce9uLvVNXis3+1x2n+skVCnk8NKwQNIwJ
37ATtLOqjCkDJbudT0SFZG8iRBH5inO4hgDjPzMOCSA3G7GSMth64ZtBb/hI1e4mf7MwQO8G6QEl
2KtIYnSQAFB8zJhSwIJARa6cjwlSU8RWxOHcK6ozlRTjKKpqzScfetzNJyi+Zu95J80UcWf5hSow
oUMLVUqU8TQp1lFRtNynJ+9K3Na8UpLltyyd21Ym1GSW1Vo1EtrbqpCS7kWJly3BaGUtkkZzIqEn
cMD5t3k6X2oatr721nLDcQWjJJItxJAkjjewWaF5FZ+iqAx+VAWyVOCfXvEtjAq3dtmadNpET/Zp
hASDyvmyoY3ZepUOWA2nkjjzvw9pEWkXV1f3kdrF5qgRJNAPMkXc3MYYKVzgBwNq7iMhvmI9zBVH
lmX4zGQhJqMXHkqT5oylNtc0fdbburylUV731lZ38XGYeWaZng8v54uPNTqVJ0048kKalJK/MlFN
xSUYPWPL7ykzvF1FFUK8KF1Ch/8Aibw/eHmBurDqR6djwMUVzv8Aalnk506369oogOr9BtPHP5Y5
yc0V4azGl1hT6X1p93f7X+fxPW8ZX+kWBrrRTnZWS0qWsm0t16vrbm1b5bv8TvC+mXEdtNK1tFlQ
VU3MCbIUdpAAgwzK6YyJkO7bjJZC6nF1y61WKZre21CIova2VEUks4IeQgygn+JRg9GYAgYksbvU
ght5VBt5FDSRmSaJN7F1XCgsWUgneG3c4xwM1ynijWP7PilcFGe2/wCWKSYnZkVmRAGGVTJDFxnh
gHYOp3fheEeVe2w0MNTliayiqcuWNCrKdR1HyUlGKUfdlKUW5u0eZTbUpS5v3PH1MdTy/GyxWI+q
4dS9pHlnWpWhGU051ZJtttJN8qabXIrtswNTfWrK2dL28m1B2BkD3BdYrZiQVIgDckZIMgwvJ4Hz
Gr3gjQNa8Q3MCz3eoParKJUsLR38iYgMGllWGQrEgQLufeXdQqOCqqDxegLrXjzVftc6RPYwKoax
DiSciNmAXy0x5rOSOd+VX7wYhVr6y8Hz2+n2H2az0c6b5OFIWNLeQOpI3bg5mYnkhTn7zZwAxP2m
b51HJcrng6SgsXiIqOIpUsVhVWpKUZcvMpSu768zVlZ+5Nyjr+d8O8OU87zV5hjJVJZbhqiqYSeI
oYt/WpqrCUqkJ/Aor3bJzcnK/tINKSO80PwnpGmwrd3ckUBG2LykfZGpLSMC5ba5YAMrBWYDgqdw
JO7PdQwylLMGePy1Et0IibeGNTtVmkVjvAIJUgMVwSSc5rhbvVgZybhSsEQ3LlnMsmSyknGeclyG
AyQTlQTmq891f6to06WVxLpdrEDtVLf97Iu98kSspTZ+7ydybiWDFnBOfznKcHWzDGyhVhiKE2nG
pXlGeIhKUppQqOnGq4ytHWdRpJX/AHsuZpr9ezXMMNlmGUYOi6SpqpSw3MqcpNOTUOdxXK5cukVK
9mkk1dnZa/8AEPRfDdrDaefa6neTlEEUsqRhEYkGRVd/MZRnKlhwwC/eG48xpGp+HvEOoCCNrPUb
2YgyK8bXC2YBY5SV4gkYwAdqMuTwC7ct5honw11jxVez3M1rdvaRyKkshV7y7kG9maaN4/3cSvyc
oMkk5Gdrn6g8L+AdN0Kzj+xWkdhHsAkaNC11MQWVjM8igjJjDEEsSzE4GXJ+wxtPCZXg5YbB47F1
8ZKHJXr0qNKlh5wbS9lWqp1UoNL+BSl8Ul7SSkmfG5XXzHN8Q8djsDgcLgKVaMqNKrWq1a6qJTgp
UaEkr1JSak8TWVrOKowl703t6DY/2XLFc6Pbpc3kW4fv41SC2XbIoYKDsPyjKMcvyQGEg21ua1rN
royyanrNzLfXDKrfZI5pBlCXJSJ0XCIvQKh6kFVJ5PIeIfFcXgyD7Qmn3WoRyFI9wdBnerKWgVAD
I5KJ5gkzzztbBIpeGNCv/F8kGva7dyxwyNvg0XawnVHaTAkt9pYgLjkMVwQSWHynvyWNDB4aniM4
xUaODnOnOlhleFfEzTqJxhBOU5wmopLm/d8ru1Fb82cY3EY2tisDkdB1swUXTq4qTf1PAqUrKdap
aynblly03z305nOMU9vwy3iPxfqbzzSXVppaoP7PtMQLbCJWfYZYHjDyylMETNiZsMEYFjj1G8vZ
bRbfRLK2uNU1EgCLT4QEB3HDvJI5xBEy7mzkDjBIO4nJv/EFj4RsI9Ht5be2nnKxwWsCob1WdgEW
UsAEVcD7w3oCAHyyluv8P2Een241GGI3GqXkCiW4uGZ1VjJKHzOpbHlkLhlUchULEAtX0mLlQnGh
mGJy9NzlCjlOAp0qNowi24VZzkopR0tKX8T3r0ormbPlcF9boRxOW4fMny4f99nOazxFWMvbSqSd
WnSpvmbnJ3VOD/dQ5V7WcprklPaaFHosKXbafb3GtSqrNaR3AKRszO/kpLl2Xc3IzhDglVBwx9Bs
rLUtYs4Z721/szavlmMlplibEm2NSWLkNtXcSgKEkKGRRmHwboE15Ol1qYxLLniOMSRwhXnwy7wo
2yDaSxJA5fDAbz6PrE8ej6bcmws57+VUVBkFYwD5ilwEyGYY/vBccYYYVtqmV47N6FShTpU6sq86
brzpu0oVIStDDqPOuamk3yynFxUuaUUmmVSzjKsmq/Xa2InRhSw0nQhXjeLpN3eIc/ZRVKrNRfMo
z5nG6bk7X8j1u5g0O1mtpYFiZRvDPMqSTD5wAsuSYw/y7MnawIXiQGue+H2g2Wta82t6wtxII3jk
t0WQTApudRHIFcqScjZI65Y5IZQPmYPDuoeL9Xgg1FZbKKO6BuFgZpJmQsxjVnYEwROPvRg9VTY3
BI+mdA0rS/DmnDTtP8OiBI4grXMDW7NdyNIwWS5LlJkjBO7H7xtrMFJIJb2I4BZLhv7Oo+1qYz2M
XV5FRhDDwcmpUZ1E7OLs5TaatGzk9eY+fo5k+I8XPNa8oUcuVZrCRm6taeKrQvyYiFJ/AlzSUE05
SlypNqLRq6ajm5X+zdPa1iUJ5eIFkmmUbyGmdVOMHfgks+M7iwy1bF9oEVzC0t5L9tLRsw+0XTC2
hLM3IKsDlSDtRFGMkhlQMaTSVuLe3laa2jiYPveSGaURxIx/5ZFwxkbbknywDksoVtrE79jL/aDP
FHZTSxExuklyUG9lIY+XD5WFTA3fO+3PmZLMST4c8LRxOMq0o1ZToRspSpRUZ86V5RjOMG+RXcZN
XbjazScmfUxrVsPgac6tCKxM4ucITn+7iueajOcG1ac0ubl+y3KM5Npo4mPTp7K2KtYq9qmQLuBC
Y0YMW2zGSP5Q+f3cse9SdgaMBi1Zttp2oeJluo7RfJtgwC3rxfu4nVpMoiYVpy23ayErneRuUgof
Vr+xnezlEzDyCMGGJWUo6FgFaZSAuWAxj5l+f5gVU1i+GNDtbK2vJYVkWaeWQpJLdiQsN0hZDb+X
HtBZsrIwdQCW+UqWf6TLMmhh8JVxclKMoyhGj7SNnJuUk1eUlKUk1GSm+ZqNk4NpTPjs2z/61jqO
BjL29KVJzxKpVNI+zclF3ipRjCV5Ra91t2SmuVp5OmeHI9PRNkf2u4UKJQYSiSfMd0gRSwiyf4mO
1funnBHoOk2kVxnzLcPPGRtii2+UpXcVBcYjkY4G4Z2hioJIDmtjTPCU2pQrIzSW0gBB3vKQ4Lc7
o1Z1KHB25VSUfBO5Tnq9J8Ntp8zBdyJEoxtdcysHJKkOGIUgA7QoJG0liFzW/wDs9KtOC9tKqm1U
rNNJzlebgnduy05uidtWuY4ajxeMoRmlSVFcns6EHG6gmlzuGkYyaWlnorK11rhxB40xJbiJ4ySY
lMfmEqXAxGu4ZGzkAsxBU4JArobKWzu7fc93JDNEqNnyLiOVRlvldpdo4IbO0FhhDuK9bbbLi5lR
o1t2cE+bHGGlYDcMqSozjq2c88EnG4Zd19pVFtLFTKwkXzLm4QzS+WGfJKbf3anP3mORkDaTivMo
ONevVp141ItNpShKNkoSck+ZOWri78qV7KWqs2+/FznhsNSqU3CUV7NezcZ3m5S5fh5o2abu3N2t
snzHM6xdBJbh0hebCbftQjkWVwrOE81yxjIDYCttDEMS3zKoN3w7oKPYzagbbzJbhQzyTxLF5agk
7GXaHz8o5kUlsqSMVk+JbRXvI4bnUFsnWNJVjYFftBjZjiAR5Lcfej+dd235c812nh6wR9OWWTUh
cRCIohaVUjCjcNixAhtwOflaPIcr97DMfWoLD4XCNxpVIvE1FGU1Co24O9lOo79Vs5JJtaanhOWI
xuYzpSrUpQwtKM1TdWlBQqKTjKUYOSXNytpK3NFObbWjlzNxai0kMM7wSxOxYW/VSCXDoVCoYyQn
cSbdwUAl81LaWNvISsNhbQKw2IwDbQQ7nMkZZ2YnaDnK92IJO6qF6kP2y4ZJJ450JCS+bujI3N8p
iYhh0GSg5JO7kAtr6bJdpbi4aKBpF4VkWRsqrNhiCQx4PYHGFB+cVGPwlFUqc6WInCd4NRlODk5c
zXuwSTaVrp62bs5LRPqy3EVFiMTCrQUoKErzUXyKnFtLmqtKN52+FS+FrR3uYOsaTd2yytILRB2P
7w7gN/KwHBJGFbIzzkEgsTXFWNiJ5hJqZka3zhLiJVW5yHkKJ5EyqJFbAC5mTYMfK5Br0C/1Ge+l
KSiC4SMkbBLJHHnJIWQ7ZJI3GdzY3Lt+UJkmsi5uEjtmluUtLOUMNscQW+6E4KyPNbI4bqcx71yN
yMwr2IQx2DwvL+7l7WME5XUW103lfme/xKy5lZ2uvEnUwOYY1Om5uNCTaTUpxdpNP3YycUo2s3Zu
/NeTS14nxLJBM9pbWl60UUskYME6uW+RuS6KfLUEAZZJWYcZJIINq/0CG/s0Sa5sQGAEE8dxbKyA
E53LOiYbI+YRzYzgE4+9w/iLVbvWNY/s9YLa6itmQvIZZIFiY7ivmLE0ciM5GRhdqtnlwCT3MdtD
PpDxzWKPLAmVuLee9E+FOeS940cgJU8pCkhzjczArWuIw8FgMLFOjTqOLnWpz5pScZTlyym23GKk
lpFpSts+Ve9z4LG1IZjmEnDF1qTlSp0K1N04R9rTUuelCKlGT5W5OUoycWrRdnF35A+FtYQskev6
R5aErHusdPZtitIF3H+1eWwi5PcsTk4Ioqo4be5EN3gscYkkxjdJjGZ1OMEEZUHkfKDuorhWCur+
zwb215Eu+vwPs/8AybW7izr/ALTWv73F7/zw7v8A6eef3W2sfz73OqC2mmuHuoIwG2tNK6cq+9Qq
qSR8/G3PGV6kls17LwhqHiuN/wB8tho7MFub8xmW4k+Ysyxb0ZEDlsF1foG6rnPPeFdnibXLe81n
R7mbS14ht0V0llCl8Sl3jkjYZALRMCmGVd6uGce/LC0aOY2FnZLtRV8sIkahpFTzIkCjOCOeQCCM
kAk/z3Syd5FCNKliG8xn76rUJQVDCzbf7ujFx5p1Vy+9OcVTSTaamj+kFmKz+nKrVw7ll0/cVHER
9/E0rz9+vsqVKdudU4SdSUW3Oy5rU9F0TSfDIh03SrBhHGiutyiki5clwZJH2kux+ZsK6qDkEspO
eqitLuRLg3V0sSDcfupGUxvZXVnOAGQ4LMT2BHNcBrvi2x8MReYJIr25KZCibB2sXGQhIVRkMUK5
xjDA5LV5nH4u1nxOLiIxSX9qZBsETSRLbxBn4eZpGj+6SpXZlhn5jgGuvLOEcdmUq2JrS9nSrVZL
EV8VJvEVlaSlOlJ3lUlJp8jk1FSulK715M241yjK4fUqSeIxWHpw9ng8LC1CgpSmoqco+5CMVG7h
BOduVNXcpL2K48a2UZl0yytG1EwExTagwtjaq4JUZmOS7rjO2PaUGRvBGD0XhlNW1EhLxrhrKOMj
yjKfs+XZgES3jkUAKx3K779h2qApfnx7wr4SuPEEqLDcRRW0TA3GZolZCkrDbHHDC0c23KhWLJ8p
3fMSc/TnhvQ7fT4XgluDBbxxAT3krYYAEjJQtjYxPKqCV4baCwNfoNLJsty7BQwVCpCWJVFN0kqk
8VVlFN0+evKClzWV5prZpKKimz4FZzmOaV62ZYynUhh4yhToYipOjRw2HjzPWnho1anNGb0jWqJy
b0c3ol3Oi3EGm2scKMYpCigLA0aSgZYENEjJjhh82WYjGSxOTo6r4nTTIY9Pt7Yz6jdz+XHb2xkl
aTzN+HlRmRYzk7ieV+8FO8kVxFhfQ3X2+y0awlkVS4XWmwIrlFADG3UsxlAJJVuA2W2ZIGeg8O2s
OlQy3jo1xe3GWM0qObjBklTEXmF2QruXbt2gKQuCCc+Rh8FQhKeKxzjL2TSpYaT9nh6PvTeqi0pz
fLecbb2TVk7/AEDx1WrR+qYJOksTGLlioQlUxNTXVwbb5IuCtCevK/e5W0uborL4dXOumG98T6hD
JAgjlitp3WFbeRWdkSVAg80qCoUjKNyXJcuK6e/1Wz0DR7yPTZbK3cRNF5iSK984RZFAgQYKxsI8
qUw3JflgGNC51FLC2BvrmYuqiQWmA84JJVcMoCBME5RvRiCSGznWelQatcjUdStLqdgy+RbQROqC
PJAaV9ojcjktGTuBLDJYtn2Y5VQx06GaZnGdSjh1ahSpe9FuM1OMKGHVOcEnyuM5tXtfllNvXxam
avK6NfKcllCGJrS5sRWr8y5XKTjVliMRzc/PHenTkm+fZKFpK38KvDdndtfeKNTuLvULq9nby4JY
5HjVS0jDzZG3BnyV2Hc4A2sCAxNfStvbadInlzsTHtidI3VoF3jdwhjkyCCvdRuOCylsgx+H/Cun
2ljFeRTXLRiGKSK23S2ljbzlW3F7dF+dh8qM75IG0YYoc09X1WSyXyrS1t57xQQJCQluBuAGHkKs
z4Usu/G35hgkgU4SxOLxyxCvUp1Zqnh6Uoa0VzVfZU6Sa932cdFK93ZXu3rC+rYPL3QqLk9nCNTG
VIy5lXa1nXq3cnJzlzTcZX0sk9G11l54jtdPtfLMItkht1MMdrE+ydk3KvmzM+VdhtGT8hO7OWBY
weFTqGuzC/vL24Fm8zhLOVhGnlglUkhIdg5XPzFFy5AyoyBXlJ1vVtW1Sx09DayKV23LhPNWGEPt
mPlxsA+8uuwDoFyQME17LZ2z6BDBdIjP5MKsnnKWtud+9/IX5o2wN4IG7JXBBINfcLDPI6caOG97
MsVCM6mIfNJ0aVpuahDljCmuZRjzO82+Z73Z8EsVHiStWqY2MHkuCl7OOF51CnXqxlBxqV6nO1Va
S5qcHaHK1HmblJP1qAaXaRRC2sYhAWKb5opVaSTklm+dGOcO24jnGFyoWuh0rTPtjyzNCvk5Xy7h
pFaGL75VUQshl2/LhNp5BViTtY8JoerpqUa3L2/2yXCh1vwU4Z22m2t4uAo5UMz8k/OwL11umy38
blkjSIBiNuHYxozOWOw7iFbnDZyoI4JCk8LwdXH0avtnHD4qo1GMudt1nqm6lruLnZrdq102nzOX
bHMI5TiKf1WNbFZbRSlyOlGcsMle3sJ3TnTSs4qS5ovSEpRbZ3Nr4bteZJJ3BVABK6OUIDTMAkAP
lgjGQWDBdy/MQMBJ9RttKheG3iWJvLxHO5UzSMXkBTZjLqegPyquQTllZjRj1ExW87y6j5LFEXG0
tcMA7KRtb5cqVxubnaQwZjk1FY6NcXzz3u2Yo7pie4uYSYSHlXcqBS4VsEFACgJDAhWanl+SxwcK
tfE0JQUJJVeWPvTd5JRSS5uRtR9612nLVLa8bxFHH1IYfA4mFerXpQnHmk+WnCTlzSlNtfvFbWDb
srcykosx9RvZ75fIvBdpA+GMdoI/3gDNt80RMpVGGdxJDAYWRAxUnX0S2jiuElt7ZBYRxgSzicMw
YOyqhkEsjNtwAd+5sMFDAKTXVx+EXmtJntWe6SNC1xJCcBFDOx3SYKkYVsq3BGNmCozJa6FawW6v
AJ5JZHVERRFDAXyQf3RO6XgbjIGKswJGBuY/RYWVKtRnKVF0oUYpUnK8LXcru0m3GT933pXfrqfJ
YuFXB4n2dHE/WKmJknXcG5PRuyulF1KdrpxSUY+9a61Lo16WzXbptsbeFh87EmR5XJYeYzqULgFR
t4P8RIwWIt2dzJfOs1yZTMw8tzNBIluvLFWV1AjZicDJy4yA3C7jqWmiXbwvNc3EMccKoCkhZEj3
NhRsZTvbAACq3OepYtWvp2n26zyxx5uBgb96qEHLHdEhk2BdxXaXbOOrE7WPBXpUKa9tfmkpJ8kW
1GU5Ssk3JNyaWraV49brQ9DB1sTiJzw6jOmrJucoyk4wipOXuxcVTi7LkblZ6WVm7o1tbWz28t3c
+S8aMYsAvvDq2AAhIBIX5d2TjP8AFhjlaze6U8PlxhLa5ZcjbcOk0qgkb0VSp4I52hmDbuCqmr2o
CW3tZ5p7qCQoWSKPaAYz+8EYAbdu3H5cKNm3BDFs1xElhf3Q3ppLX5ZlIeSUBPLLOHjQLJ5kLFcO
jBuOBtchRXPSy2nhqntsTCMOab15+WLjrtdpWSenMr/FfV2OnF5rPF0q+HwkuacYQjyqnKTvzWXM
tZNyafKk76pXa1drSvDBu72fUNQuHK7FaPFzK7OcsOYW/drmPajMuxiS27cFJNrVraDT4i/2i5WA
EbE8zzRCSXBYQiPncRnkE9Cp+UmupsLWXTrGaG0tVRGhJUefNeNC53syzysQ6KeoByvUkqQawbWz
v5Z2E0MCo5wbiObzQMM3yCB1LspGWBV2ILbSpBNdFSjUxFRz9tD2FNRlCEZa2TkmoqMbO7S0bb+L
ZLXjoTo4HDqg8NUeLry5cRUcJr35SlZuU25Nx91JXS3d7+8Y+lW7Xbm4WydUKrtuZoZUeRFJCsTK
FOW3KRsUDkgBuc61xZ28Sb2uTDCwcyqrFcsCeSw6N9SWKnAIGRW9BF5MciRSSGIEh0+ZSjZJztZB
xgfdwCDzgAEnntZu7KVRYNdQWspBOZ2liJUGUFm8qJixweq7/m2ggBnauTDYOWIxs8RCKnODSkqc
GpSimkpayk1JdXfZpJNJt9eIxcMLlyw1So4QejnVn7nNJzdmotXu1ZRfu95PlbOEWGCbUJEthMYJ
GO0Ir7W25XdvdzG4JzyrAHkZxmsHxRpk8VrNJC0ZRVOfNV0mhYMy7w25oyM5YBlHAbDFg5r0zSbZ
odPkggiE6iR8SoWEY3E5+aUYYE/MGA5yVxgM55S7064v9Tmt4b97doYg8lqELJK3J/czhim/HARw
UJJBbA5+krJSqutXpfu6MFOUJRcr8l7XV7czsrJvW9tbM+ZwjnSwkqGHrR9pi6yp06tJqm4upNqV
naXuR1lzX0TnaSspPi/BekR3NtJd3Vuks4dx9oeZnkeMn+L5iFj+XIjI2gHJ2k7jY193tIJ7bT/n
PzMFiLABtxwRIsi49SjbkKZBcMARrXduNAb7RE1y7HalykoSNh8zBZCkLMRnjA2lWwBncec61uJ7
p52EK+VyyXTQyQpgswK7JUABXd0LsGAJVs8H5/nqY2viMbVgvZQu4YeMlF6N8kJttr3Y2do63b93
S7+opUKGDwmGyyhPmxNSKjWxMozajdyc6sWkuVttXc7K7V5yavLztdTvwoD6dGzgAOzTTbmYb9zN
l2OWOScknPViQ2Cu8NlMSx85Tkk5AIBy0nIHknAPUDPA4yetFY/X8Rd2wlG19PexG13b/l725fve
lt/WjktBJJ493tH/AJhsPur94v8Au7vtd6St+B0FrpukRulgIEt4ETyYmlDDKrL/AK0htyLjCjB4
OFBIAI868WeN9YMM9vDaG5wrLHBbQkhjmXcCY2eRlZdvyKWYkjaxO5TDp9yb+9ntNKkVpgR9rurk
uIoYGZi4iw5USIZM7V+8x2hyTID6PpbaFo1tcGYxz3Ays0oj8+Z1DO2xoicxMOcCNlJyPlZlYn8Y
wmGjg40cZiMNXx+MlGVV03TXvpNKU60nCpNSSjKSaikk4Rpypp87/VK+KnjHisFh8dQwOEjLl+tw
qax53Llp0ffpRahdJvmTburSbcT5+0rw/wCNbuWDV9Q0i2msLhy621y6h0R2dlEkTfPGEGAFPIbI
IDhc+oadoPifXpZdMs7SzsdFiTfPDamNIAyKBlp1CFidhOBztMS4JUMentLxtauC1lbTGxhKiVXB
SEKSQGlkclMlRuxu+XOMZwD6d4dspNSK6ToFsl07gSXL2yNHawgFlka4uHBXauAzMWK4ACKxG2vc
hn2Z42ao0sPSou9JRhTlKdShKaUYe1lCoqcU+qnZp3505Js+cw3DeXUISqzxNavCc1OVWajTeJ5Z
S9o4RcFVdOo2pJKUpb8s02zA8L+GNP8AD0AjtJYHuni3XEhEiwxBDJuUuWUuoYj5cFQMlmJUtV2S
+8Q+Jp20bTEWW0VvnuHjiiiUIX3bplCM0Y2qVRyzMrBSAM12l1o1vG505mNzJAVN5eQzErcOfMzb
W4jbBjTIAbAk3By5LMFXSs7e3s97oq2NokDtLbRqAk4USYeWXCOHAyW5APLOSQrV6WAxOHw2IVX2
08wzSbpqVaPtKuDou6VpSjLlrVI25ZqElSi+VRk3Ss8sbgsVjKM8MqMMuymnypUYKMMZiqUOZuUY
N3w9JybcpVE689JNKTudN4O02DS7WOC6kjkltowtxKsaxW6sCx2QrsKgk45AwxLMAR1j8TXt3bSi
TR4Y33bPICXKiVmdyPk/dJtwxU7csMbc5ANeXeIPG+6RbDwpZT3k3lqsmwu8YYM43PGGdmjVkLIW
yMjGf4mv+HI9Wmms9c8R3qyXURU2ulWsHmojZkEZuVAIiYchjtBA5WQ4wPShlSnKeLzlxoWrKpGH
NC9dym3CNOny8qjNrfaP2bpqT8x8RUacFgsjUqs4UvYTrpVHDCUabVOU6tWpPmnO1lCnFyqNJObW
7928NeGpDCut+Ipm1K+jjjmESyRyJaqAcpLCojVlVFDMsgJXBK5I59b0bVW1KApJAkenxFFAtoQs
MgTf8pCncpOeFB6AHGFNeVaVYeI/FDSoWe0sWWNGtYiyPORuIDISrMAMc7s7eildtezaTp1v4btB
a6pLCgeKPy7SHBeSRNxDzjd8rkLnIzktlmJXJ74+ww8a8sRXliMTyuNGnCVqNCnd83IklTk2lq2l
LRc13cwhDE4r2FLD4b6tgeeNXEVZKTxeLq8zbnUcozqQi72g5SelkmopI7+yMMlkYPIF7ujiFpGt
xIEtSQ+ZJYUJ8w4+6XYoo3EkSDdXO67pVrJbSxX9ktxeqFePy3kjVQWJVi6TeWVBHAfcDuOWwM1U
i1J4N8+nW88wlUBYojyAdxVgXGGBABEe7cDnPANZerNcSw3D390VRYUZI0Mnmk4lKoGUEJIGG1lY
lFJUEYVmb6ThXDYWUnRxPslJ1Kc6Sp2qVE7uScnFScL2u22o2as23c+O40xWMoQlVwXt6kXSdKtz
upChaPNF3i2vaO9/hd1KSUotRXNqeCII7Sa5lt9HijgXBkvZgHKt83Cuy7pBIw3bFYplgSCSRXs9
nbreRpJclZIjgCZoQPMjLkgCAuFOCSBjGOMncMt4l4DXU7mcxAm6XcmyJczBLcSHYbkgqYydrDAG
3JPzL82fo7S9NjgWOeUafc3azxrJazM6JDbkttaKRBs+Td8y5B24wG2la9LOMLh/r1Vwq04TXJdQ
ck9rJTbu4+7a0Y6N/Z1i35/DmLxMMmp06tCvOlKS9nCoorebTkqcIJtqV3KdRtqMl7ytym5Z6PZW
dlFNY20hjkf95dyIfKTlxxxndGSCkajGN24FlIN650+WGPz7ExylggeTb82Mtw2WHlqRzjqPlG05
JGuFkFykt1P58DCOJLeCRhaJkHHkRALu4UOW2k5DZyA9djaaPblbiR5ZpQigRWsUTFgMEbyyYwB8
pJYEZzu64f5rC1HVrv3KrhGaanKKtK0mm7XbtvJXW2rd1p9ViKcI4aUr0lKVOEXCE3+7bV3FTTvd
RfvNWak0nfSR5P5LxyC3kmH2t1Ut5akC2XL/AOufGWibdncuWjwByh59m8L6XBfwJBMTNdpHGsrS
yCCzZdxCytPvVmA5yAoYgEsp2nGPJoFxqs1u1hHZoYZCbmSVNjpBwC/m3By0gX5tgPlsCckFedu2
iMNy9pHqL3EGxEQ+SRCp3PmAlCmxZiCFJYoPlwwIAP23JVxWHp4edoqXK5zcffaUpONklv7tuVOy
bbd3F3/NqMqeW43GYqk5Sbko06cW3Tu7ucm5N8rhLmcpLVpuN002+kg8NyiaSG61dhAm6MwafKRa
hDk5zCyGdQM/fw3JPBADdHB4Li8xZdJkkdVjQmXUfKIkZS4JWIKrqAF6k7sMSzZBy3wyml3EUjTw
mG4tyGeBRtmO1xhmkYbdrDO4kseVLZJyepsb+0u7yWCYy/2fEoUxRuYSGLtgSXGA7KwCq2wkY4DA
hSfNqwjTdWhRU3bljNyivdd5W5bq13y+aTatZ3R7uFca1OGLrqFNttU1CpJucdHzTd20nJaR2Ss3
7smzCtdDsb2Q+dA97cRNtLmBntfNDsgKFoii7vlXIdmGMnBzk1Hw1dWzYvpYrSNsBLe2Z/NeOQso
BABlAcBc/eAIJCsQxrvbnW7qxsbjStGMFjp+oTRCWBI4ry5AQ/JPD5qO0SluPMLBiCwdmAGeG8Ra
PqLmDCSTXqspWWdHkWZXJUh2jfbF32jBHfkjIywmErLFutiIy9ilFU24pqD5rtyTjeLk46PuurWv
Zi8ZRWX1aGFdOpWclKajLknV5mk3dO8uROL3babjeLuYcmiaVbwSJAI7iQBQyTSz3EisN+M7ieDj
hYmYLvGF6ipdNuC2218uKO3UbfL2bN7BmyFjwsgYYyxcrhiMg7TWlotp4hSe4judLtT5ZVop7eOS
SJIyzDbcrLCrecuACyMUbcfkUqK6WTQLVydWuRFbsiHzJIFO52cMSxtklzknAMoCjGN+cYr0c2oU
cTKnCbTcoxinQvKzu0nUTaaXVJNK3M3dpteNw9i6uGpV6lKFqaqLnVdSh8Mp80qTk227Xte9207t
KSMi2traGZkjhlMsmDCuC8LctujeNm8vJHRg28fNgg/NR/Z17DcNdT29rbxL87Ko33AHzlmWUs2A
wAO0YIwPnJLtWVd6ne21zBa2mnNcWU86q021Guhy4EkkbOPs6DCEyKWYENxuG6uwvdQe00vzLqwl
kaVUURxsGYgGQZldkZX5OWbrtJ2hjmuGOAeGhCFL3+d+9a2l2ktG939ronfV2bPRWZUsXPEVsRKV
JUbOE22k3dyu7Saaask3o3JXirJnEapNazhii+WFXL3BLx7gC3PlkHeCOh5P8AJKiuHt9Gi1iS5Z
72NpF8zyFKGRyq5bMQ2RnJbYdrnOeCcjjvLq1a68tzbxrYybQ1sud8TEMCWcsTgkcgknJRiQMqKs
sS20JS2giiiClvNjIZpFBI2SPnGQU7kjBwVwTXoOMcJh3ChT5q9VWlKHuukryV7pXcm3o7pNJ6uz
Z50ZPHVlWrzksPTacKc1eFTRpS5eblikm22k3drXmucaznSdPmgjuH83IAaaByo+aTd5axvI46dN
mAXOVbJNNuZLfTNHbULmWS4lkjjYBV2ndk5RT5asqEg4LIp+Y72IIamwQXVxdXFzLZg2MRKwTxXT
bmZXJbzIG3MCCMBuQRzuIIJydX1We/uobC0ti6Ku03EjxnypATtLYRldM+uBuOCBgVlXWJq0fqUY
uc6rjLE1JOV1FXaTmndWvzSSfdNtqTe2EeDo1Z4+clCnTXs8JSjTldvmlGU1FuN3Uv7rab2lzJpt
8tfzXutkSpHNYwqu0rCwknlX58B5Fd2iyRlcr0Iwcg4u24WG1Y/Yg6KgEk08jEk5YEkZIyOueCCR
g53Z6Ka3TTLdbu4e1ifaFnaJjHGWG8K6h3OM/KB0UtngEVx13fXF3PHai9aG3nB8xYoChfBY5MhB
UggjGF4wxGC2a8KDdTELDwShhqMVCpO3uynHnbqLSL998rs+l23uz6mnQjhcFUxMpc2NxElUhTlK
XMoyknGl8UrKnFrRLeyTdosyWucsxBIBJIARcAZfAGTnAG3GecYyck4K0xpUAGBEGAwAxefJGXGT
hgMkYJwMZ6DggFesoZelb2lPSy+OHmu/n/6VvzNnmL+1nraWtv5u/wDwH56Xvd6/y4+GNS1KRU05
rZoEcefdSW8UshlBJyqmFZWBzuTqAFJO8ENn1WPR0t4YA8hV74LJDCobex5UGQy/MoJxuLcYzwB8
1Q6Yf+Ecb7VBJDM87hYo2UBwWLqxMaH7rkgnnhtox8zA+ieDNK0/WtVOoa23l21u266vGRv3C5DP
HDGWG52CgMqkrgsWZFLZ/JsTLC4mP1qgpZdhasZUaMk+apWhNxtNxmounStB80k5U4wlFc8bXP0D
L8NWw9SOErYiOYYmnGFSteLpUaHJbSPI2nKV1JJpznK0pRszrfCfguaKytXmeFLe7USTh/La0iiL
ElpVJAZzk5DZyMfLgs1dnqWuWWkwP4b8LQwW2nzgSXt7iGKe5my4Y7omJEBUDanJVAQCMszYvizx
LYPAlhobLaabbg20EYfbcXUY3KskkTMzKXAYsSenl8/KRXj9/wCNby0uV0sWcF9EHijTyT5tzGHL
E+ZJG27d83yDcyjJ+RitXlfDNXFRc8MlRpYhqLrzvThiIJuXPTSTlf3ZOMvtt2fMpNG+ZcV4bAyl
CunOvBKNOjTiqvsdXZVndqCbUW+dKUFzNRs3J+nxa3Jd6jDpvhuL7TdRRYubhUQwoAdrbHkP30A+
b7x5xncQ1Wr/AML6vLLLb3GrTTLMg/c2ihxDkuCuzewZ+VR8AHIOB/DWv4T0gLYPdxaf/ZSPEJGl
vWAnd/8AZ3ANu7BdgXnGBgV0FjqFppMc4lDzTzkiMBWM1xN85HlrjcASBklfvBSDkZP1GByijl1W
nBNRq2UadL2FOrWqtSqP6xKrKcqeHhyp8qhBSp63Utz5rGZpiMwoVJucalCrFOviPa16OGhGTq2o
06UVGpXblbmvN87bhayu2+CfA+nafDdK/laY7LGJLmVJDcu+5g20spYszKD5YIUMTsBKlD6Fbf8A
CJ6H5kQUXgCCSe9nk2uXGQqOSAVJJJVRhcEgk/Ox5KCW8vmP2qFrVNgLxOTFKGRyAMZK5IPzM2Dx
ggkAndsFtWaO0kgE58wtJFHGxZlldiWeVlJYDJfgnHGAM5r36mEpVaX1mWFpyrYflm3KbqRjDmdp
QbtF3jDmctdWknpdeBh8TXoVFhaVdunXi40l7JUoJrSNNxppSULSSXvc1tJ2tzP03wtrkl/ZpLpw
tI4dzo1rAQJQiM4DyXALBWx6HG8jBJyT3Utlp+oshuQ29IslH3HLkEn94HDdScZJJBIY9K43SrMa
YYoLJEmtZNhWGCBIXt+ZDIXdV+bZ1LtkEF8kkZPplutpbQGZ41n8wYL+azADLg9T14weeCGXB6jw
MNgcJmuZYiFO3sVGCnRbkpOUpySdKUVB20S91t/Zm29ZfU18wx2S5VS9vVTlJxj9YjG8Ie7Jp1lJ
NRX2btqDa0SaKywSRwKtsY1iEYChmCYAZgDkBmZskAcEkZDNklq5ubSta13UINPhshcWysss9wWE
cEW1mB3sqDcdp3Kmc8nCk8VpfbUu5pYLOcxqpzCTC8itmQoEJ2n5DvLgn5gNvyscV6loWjajb6Wo
l3SI4Ds0KEMXYsGKhNpbGScHGVAOTgGvr6WWrKqdab9nSrVYKFKEk3OMW7e1lKylzKySje6d9k3f
4SWaLiLEwo/va+FozU69aDShUlzO1JRty+zerlNe69rNrmWj4V8Lad4ftpZbdU82RAtxcx7flAA6
KGy3IDcgHOBgkc9XbtMpjKW8jQtgzPKqYkx5ijK4wONxUYPfcpUkC/4esYzFsXfO8REnlyxCInly
u7YQCB82c7m5XJJBFb6aNd380Ul2jHkeXZxApEEV2CliQuDkZJOeMdVDZ+ZxWJq06qpygqtWST0u
5JKWrcnJKCd9W05Nu0b31+ywWCpzwjqx9yjTkkov3YSUWkla3NJp3UdeROT0klIdod/bt5sSMZHt
8ZSGM7QvzqIwSDhgARkEY+4eW57DRtQfULo2MiyWtvIwTzkZla3G5sNK535B3byrcH5gvBOTSvAu
pagbh2hksrSE+ZMLdhGTCCd0kku5QoCqSyseflYgBRnRkuRoMcmlaXHaXkN2okuZYEmuZpU+YbYi
4l8uQBQS27JOMOScj7LIstozoVMXXi6UIKEpNy5faz5lyxi9Goq2q3u27ts/P+J84rU8VDL8GoTr
yqcsYxUpewguZylKCbU5yT3d1CMbtN6nbFdK0+2SzieS8nRQs9wCEimySrN5EiBmDDKkAkJhNrsu
c39Ns4Xd4phOLfeUMNjFHCpO9sefPIp3BPk+WJGOGIKkL83OaPJaSkRiO5hnUDybO5R4GlcrJnzJ
JwhPUsRGpGMEY2c+qeHrK8gWSS4SHy5PmsrWQtJdPKrOoNuApBVsY8w7drbdp4NenTjKpOc4wnGS
X7pSd1CDk7SlZ7aqyejaVm/eS8ZWpUoUnVpunJw9vKDalWqcybhBSbacrSu3dxXS6bKtrfanpMmp
NbaWbSaONEuYJbeINd2WXeGaN1ih89o8E7lX94G/eLvLAXbTR7vxFJBf21zBOZwJpLSO2ngkDAgy
JBNDJshJHJMkbRByxIX5mOtrug313ZXes6vftYvp1srGA3s0l1dR7m8uCa2eb5VJC7ZEYFflIjkC
ms34dve3GvJo1rLb29tqYAhuJb5LZI7kktJDcu7qVWRF3xtGwB6HcqqaxjgIOpHmqc0rJ3lfWUpP
l5rpayT+Ts7Nq4oY90JV4SouNOUU6T/kgub3ee+0Vrayb0Vrt33by1jsEjjjvp7WWVhEUXyrh4JM
ndFczwuJFYgqy7QVZcsqkAluj0jR9PjtVe+uri7DFDJbRDa8hLnBS4kVkVCxUNvKyjgBSFJb0jxB
8HvCF/pdhZf8Jha2d+LiObUYNCivdRgxE0gWF9Q3ukqyMoYusqzQSlF8toy056zwfp/hWOymjMJv
raFvsUzIYxK00RaMNeJM/ViNxwd2MAhtpNdtWi6VJ4WFGXtavK+e7VOCjJ6Si2pOTsrfZtKMm2nY
xweL+s1nj5YiKw2GXs4RUf31duX7xQabioaRXNaTvFtW5uY8wvUMEcdn5D20e5Gjs7ZRLCOWwLqV
kPzuAPnGSDna7YIPPaj4dn1GN/IRRIyjMkYWRTAS4f8Aeg7i6d/lLLggDBJP0He+GLWG1kn823Sy
kYgLaR7413M2IJYySxbG0ZUsM+gzXD6mdZFk9vpC6fptrbrJuGp6PBBJd5Z+PPQxzRv8u+OSAozr
jc5LYHmrDqjVcnL2lXlUU7Sai1fVRTalLV+a2d20ew8bOvSqJ01To3vFOSU6kW23zTaXKmtNNZa6
6pvwO7stP8PSwte3NtdSbSsJIctG+5wUJKnb6YPIOMcAgS2yyat5ElxbobCOUH7RGSyspDkAQl1D
g5AZTg/MvzYHzaWoabZXqyfbrTbc+YC5UO0UjgyfNFuLM0RzkDc0wBAckksaM8d1auxkv4NO0+BV
ZdjGUy4RiDFB5YkG7AyNm4KGOSTluyhh2nolKbtz1JfZUn0g9VLtpdLuzzK2KvTlGfuUo8rhTgrc
/Ld81SbTvBcln713fazbL9zaaMkJRbPz4znbmN4UZgZCAu1keMnAHU8ljhhuxwh0Z767aKxVkti5
Z44JAxjZSQ6NIERt3GNsqq2AMM23eehj8S6fdypDc6ms8GdgeeJ0jlXLqFVJECg913YKlc4IBJhH
jrStKuDp9hpivGXAlujKdxLFwWUOrkr3Ctxnd8wxmuitg1RUlTp89aUVay+F9ZSle7bXvK92rR6q
5jhsfTxHvYmvGlhYOMdJyUq0rrlhCnHaDcVzSejVklrKRzXiC2tLHT5xaxRrLFEUOVCBny4+YIPn
PGfmVgc9Cc58r0e0tLq4e6MEkd1A+2Z4Y54VeM7yCFmPkOox1CsQeFfAGfWNV1VNd1MQJFY/Z0YA
md3UtKGYEBEXDHb90KeSSevXJ1Ix2XmxCwZl8oMggik2O+WVlBkGdvyDAG5gScEkk189KFfDKpTX
NKc7xteTk+aUrvTW/K9bu7be7TPraM8PmChVbhClTs17q5X7NpRXvPSzW6TWso22b8p8Tz2ce6Lf
BGsi7SZ/MkkkKg8pFGSjngblC7TkAnBeuWtZbX7MIYRMq7zmN4ZbeEHJOEWSMABjhiyABhxuJya6
nXWNzbiaK2VIlchFjjYvG5L8NIUxjOOcE8kbsDJyNJtbq5SVpmtwu4KUlEjzRsfMwVCHaoYbcfPg
8cFwamng6dOmlytTes4trk15b3S+JX87Kzvdt36Y5hiJ1JVOZSpRUY02tJ6Nq6bVo3ta695qS958
pMJdPAwYIyRgE5fBIMgJ698D9Ocjkrok0OEopZTu2rki4AGcPnAMecZUYB5A6knOSsfqGG7Lp9ld
1e3u+vytu7nqrHY6ysoW0+09vnLyf3a3vr/KjaMx8QQEsSVA2nJyPlPQ5yPz7nnrn6KtSy+GV2kj
LbjgkZbd944PJ9zz755oor8nz3+Jhf8AsCX/AKSfYcPfxMx/7Dan/pR5JrUkg1GBhI4O1eQzZ/1l
wDznPI68njjJ612Hwot7ebxc7TQQylSm0yRI5GZMHBcMRkdcHpwSetFFfoWXf8inLf8ABS/9Jpn5
1jf+Rhm3/YVX/wDTh9HeJSwvXiBIiWNdsYJEanb1CZ2j8B+JPNaejqpWNioLJyjEAsjeSeVJyVPu
Dnk8k5JKK8Gp/v2K/wCvtP8A92D62h/yLsp9Kn/pVM3vC4E+sQecBNuubsN5oEm4CSXAO/dkDsDn
GTz1z6jYWtqmrxBLaBQLoYCwxqB+75wAvGe/8zRRX0E/4eI/69UP/SjzsH8VP/r9P/0mmehyRRRW
eYo44yWZSY0VCV/eZB2gcHAyM46cnHMXXSpQeQCcDsMEkYGeMHke5POcklFefwp/yOcN6z/9PUzo
4x/5JbG/9gtP/wBKHeHlUXdkoUYeSPeMDDfNIDuHRs4Gc57cnGT7vpruPOAdgFZguGI2gNOBjB4w
FXGOgCjnGaKK+34j/wB+p/8AXn/24+D4M/5FVT/r9A7nRP8AkGq/8RlGW/iPzSdWzk/iT9TXeWgH
2x1wNuyMYwMY3cjHTB7j9TRRXxdL/fqn+H/26mfoq/5FtP8A6+v/ANyHefEJ3tPDWkR2jNbJMkwm
S3YwpKAxx5ixlQ+MnG7OMnrk55r4f/NJcM3zMpUKzckAtBkAnJAOWyAedzZzk7iiv0Ot/wAimH+O
h/6cPyPDf8jyp6VP/Sj1jVAJWcSgSCKNGi8wB/LYK2Gj3Z2Ny3K4PzNycnd6p4L/AH2nmeb97NDb
v5M0nzyxfv3U+VI5Z48qoB2sOABkgZJRXRg98V6U/wD0o58Z/Ey31q/+lUzWu0SXTNdeRFkeTSsS
O6hmcGCQEOzZLAjqGJBHBJ618Z+FndvEFqjOzIJ5wFZmKgL9o2gKSQAuBgduMdOSinQ/32P/AF8O
PNP93+f/AMsP0yniii8EaZJHHHHJJpVqZHRFV3I+zgF2UBmI7FiSMnk8k5uiWNi2lySNZ2rSOqO7
tbwl3cSYDMxQszDsxJI9T1oorqqfx6n+Kf8A6TUFhP8AdcL/ANe6f/uQ7piSbVCSVzbYUk7fu/3c
kf56k81xviwB/EVvG4Dx+Uv7tgGThpMfIcrx24oory8L/wAvP8TPcxPxL/DT/wDcZ5wqIy6gWRWM
c5EZKglAJJwNhIJXhR0PQAc4yfEvF5J1iyYklhKgDEkkDOcAk5AzzjPXuTzRRW+W/wC9L/HT/wDc
h5mc/wDItq/9eDj/AImKsUuheUBHvcM/lgJuYlCWbaRuYkkknJyTkkkk0vCX7y/vWk+dvs33n+Zu
JAByxJ6Ad+mBk4ySivWf+81PSH/pNQ+Wp/8AMJ/24dx4Hhhmtr6SWKOV1uCVeSNXcEMQCGYMQR2O
cjJ5PJMvxR+XTbFl+VhdsoYcMF9AQcge2ce5PNFFfLT/AN9xHy/9OH6Zg/8AkX0f+vi/9yHn9iqm
2YFQQQuQQCCSrkkg56lQT6kDJJGT57fkx6pLHGSieXG2xCVTd+/+bapAz8o568Dnjkorb/l0v8LM
5/FR/wCvyOmjAMaEgElFySOSfXqf5/iaKKK5z1D/2Q==
', NULL);
INSERT INTO enseignant VALUES ('13M12345', 'MAITRE JET', false, NULL, NULL, NULL, NULL, '123456789', '674591421', 'mendjijet@gmail.com', NULL, NULL);


--
-- TOC entry 2346 (class 0 OID 460941)
-- Dependencies: 178
-- Data for Name: enseigne; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO enseigne VALUES ('05:20', '05:27', 'RAS', '2017-11-13', '123JET123', 6);
INSERT INTO enseigne VALUES ('12:45', '12:59', 'RAS', '2017-11-13', '123JET123', 11);
INSERT INTO enseigne VALUES ('21:23', '21:24', 'mercitoutdememevvhh', '2017-11-12', '13M12345', 4);
INSERT INTO enseigne VALUES ('11:13', '11:14', 'RAS', '2017-11-30', '123JET123', 19);
INSERT INTO enseigne VALUES ('15:27', '15:27', 'RAS', '2018-04-16', '123JET123', 22);
INSERT INTO enseigne VALUES ('19:18', '19:26', 'RAS', '2018-04-16', '123JET123', 23);


--
-- TOC entry 2341 (class 0 OID 460853)
-- Dependencies: 173
-- Data for Name: etudiant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO etudiant VALUES ('13S00000', 'MEDJIGNIA JELLY', '20/07/1990', 'NANGA-EBOKO', '14784515225', 'mendjijet@yahoo.fr', 5, 'Rk1SACAyMAAAAAFKAAABAAGQAMUAxQEAAABXMoAsAA+MQ4BfACSYXYByACmYXUCFACmYXYBPACuQ
UIC2AC2UXUAeADCQSoBDADKUSoDSADuQXUB0AEWgXYCVAEmkXUAlAEyYXUBfAFMgXUA3AF+gXUBR
AGGoXYALAH00UIBtAJQoXUCjAKWkV4BtAKqsXYBKAKy0XUAiALE8XYCaALgsV0APALxAXUCQAL+o
XYA1AMM0XYB3AMOwXUB7AMgoXYBaANEwXYDZANsoXUD1AOKkV4B+AO0wXUBBAPI8XYAgAPVMXUAw
APxEXYCjAQMkXYB3AQVIUIA8ARhUXYC9ARqcXYCHAR94XYDbAR8sXYCVASaQXYBfAS1gXYCCATSA
XYCVATgcXYBtAUJwV0A3AURgXUC9AU6gXUC2AVwkXUDXAWocSkBDAYFwXQAA
', 6, 'Rk1SACAyMAAAAAD2AAABAAGQAMUAxQEAAABXJEDbAA/ESkDEABZIV4BRAB/MXUByACZMXYBYAD5M
XUAgAEzQXYCOAExMXYDEAExAXYA+AGFQXYCXAHRESkAwAH3UXUCcAIt0XYCjAJAgXYDgAJ4kXYBF
AKJYXYAuAKXcXUCAAKr4XYCoAK4UXYDnALMcXUA8ALpcXUBkAMpkXUC4ANYQXUBRAN/oXUAZAOvg
XYBKAQ5kXYCJAQ74XYBkASjoXYCAASj0XUCXATF4XUAiATbkXYC2AVCAXUDEAVkEV0AnAWzgV4CO
AWz8XUCvAXN8UIBfAYFkVwAA
', false, '/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEB
AQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEB
AQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCAECAQIDASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD8dIkM
EyiRg6jO5wWGzazEMuSeeOfmOCMMe7d7pEtu0W+Te4UjCHGCTnJbI5ycEdeCpzjcTw1wkLzOiMXR
mDRSkLkYZ9uVDEBgOCMspyehYGuw0+0uEt1aCV2YqGAcgqwUyBl2qFIYYJIO4NkDGeT+ETUKMZ1a
ddyhT5OanKUU5x9o40+bllZbrSSfVppSlf8AoShVdTnoVsGr/ZfI38T1s5Wa2jqm7ttJ3jpuTSRz
CSOzBh2ruQlsRMcsGDLsABIUA4YgFhgEZauM1e4kt7eVJGcyEfIIgADln+cnGF+b7pGRnJ3KdzV1
qQXWJnliALBRtAZUZcOOkhPAwA3qMjAIy2XNDp00bpMELOoUDzV3QSJI3zIoJV0baR84JK8ZV0Ln
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
', '0', NULL);
INSERT INTO etudiant VALUES ('15I00222', 'will', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '0', 'will');
INSERT INTO etudiant VALUES ('15I00001', 'Bob', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '0', 'bob');


--
-- TOC entry 2376 (class 0 OID 562766)
-- Dependencies: 208
-- Data for Name: filiere; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO filiere VALUES ('BTS_COM_VENTE', 'COMMERCE VENTE', 'COMMERCE VENTE', 'B', '1', 'issam', 25000, false, NULL);
INSERT INTO filiere VALUES ('BTS_RES_TELECOM', 'RESEAUX ET TELECOMMUNICATION', 'RESEAUX ET TELECOMMUNICATION', 'B', '1', 'issam', 25000, false, NULL);
INSERT INTO filiere VALUES ('BTS_GENIE_INFO', 'GENIE INFORMATIQUE', 'GENIE INFORMATIQUE', 'B', '1', 'issam', 25000, false, NULL);
INSERT INTO filiere VALUES ('BTS_GENIE_ELEC', 'GENIE ELECTRIQUE', 'GENIE ELECTRIQUE', 'B', '1', 'issam', 25000, false, NULL);
INSERT INTO filiere VALUES ('BTS_GESTION', 'GESTION', 'GESTION', 'B', '1', 'issam', 25000, false, NULL);
INSERT INTO filiere VALUES ('BTS_INFO_COMM', 'INFORMATION ET COMMUNICATION', 'INFORMATION ET COMMUNICATION', 'B', '1', 'issam', 25000, false, NULL);
INSERT INTO filiere VALUES ('BTS_ET_MED_SAN', 'ETUDES MEDICO-SANITAIRES', 'ETUDES MEDICO-SANITAIRES', 'B', '1', 'issam', 25000, false, NULL);
INSERT INTO filiere VALUES ('BTS_TECH_BIOMED', 'SCIENCES ET TECHNIQUES BIOMEDICALES', 'SCIENCES ET TECHNIQUES BIOMEDICALES', 'B', '1', 'issam', 25000, false, NULL);


--
-- TOC entry 2363 (class 0 OID 560767)
-- Dependencies: 195
-- Data for Name: handicaps; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO handicaps VALUES ('aud', 'Auditif', 'Auditif', false);
INSERT INTO handicaps VALUES ('mot', 'Moteur', 'Motor', false);
INSERT INTO handicaps VALUES ('vis', 'Visuel', 'Visual', false);


--
-- TOC entry 2355 (class 0 OID 510131)
-- Dependencies: 187
-- Data for Name: inscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO inscription VALUES (1, '1', 'GI1', '2017/2018', '13S00000', 250000, true, 'T1');
INSERT INTO inscription VALUES (2, '1', 'GI1', '2017/2018', '13S00000', 300000, false, 'T2');


--
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 186
-- Name: inscription_idinscription_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('inscription_idinscription_seq', 2, true);


--
-- TOC entry 2364 (class 0 OID 560773)
-- Dependencies: 196
-- Data for Name: langues; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO langues VALUES ('fr', 'Français', 'French', false);
INSERT INTO langues VALUES ('en', 'Anglais', 'English', false);
INSERT INTO langues VALUES ('all', 'Allemand', 'Germany', false);
INSERT INTO langues VALUES ('esp', 'Espagnol', 'Spain', false);
INSERT INTO langues VALUES ('por', 'Portugais', 'Portugaise', false);
INSERT INTO langues VALUES ('it', 'Italien', 'Italien', false);


--
-- TOC entry 2365 (class 0 OID 560779)
-- Dependencies: 197
-- Data for Name: loisirs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO loisirs VALUES ('voy', 'Voyage', 'Voyage', false);
INSERT INTO loisirs VALUES ('cine', 'Cinéma', 'Cinama', false);
INSERT INTO loisirs VALUES ('jeuv', 'Jeux vidéos', 'Video games', false);
INSERT INTO loisirs VALUES ('lect', 'Lecture', 'Lecture', false);
INSERT INTO loisirs VALUES ('mus', 'Musique', 'Music', false);


--
-- TOC entry 2351 (class 0 OID 469217)
-- Dependencies: 183
-- Data for Name: matiere; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO matiere VALUES ('DEPGI002', 'DEPGI', 'PROGRAMMATION COBOL', false);
INSERT INTO matiere VALUES ('DEPGI100', 'DEPGI', 'INITIATION A LA PROGRAMMATION', false);
INSERT INTO matiere VALUES ('DEPFE036', 'DEPGI', 'INITIATION CODE', true);
INSERT INTO matiere VALUES ('DEPOGA039', 'DEPOGA', 'MATIERE OGA1', false);
INSERT INTO matiere VALUES ('DEPOGA040', 'DEPOGA', 'MATIERE OGA 2', false);
INSERT INTO matiere VALUES ('DEPOGA2041', 'DEPOGA', 'MATIERE 3', false);
INSERT INTO matiere VALUES ('DEPOGADD042', 'DEPOGA', 'AMTEIRERE', false);


--
-- TOC entry 2366 (class 0 OID 560785)
-- Dependencies: 198
-- Data for Name: matieres; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO matieres VALUES ('math', 'Mathématique', 'Mathematics', false);
INSERT INTO matieres VALUES ('eco', 'Economie', 'Economics', false);
INSERT INTO matieres VALUES ('mthad', 'Maths additionnel', 'Additional maths', false);
INSERT INTO matieres VALUES ('mthav', 'Maths avancés', 'Advenced maths', false);
INSERT INTO matieres VALUES ('bio', 'Biologie', 'Biology', false);
INSERT INTO matieres VALUES ('all', 'Allemand', 'Germany', false);
INSERT INTO matieres VALUES ('esp', 'Espagnol', 'Spanish', false);
INSERT INTO matieres VALUES ('chi', 'Chimie', 'Chimie', false);
INSERT INTO matieres VALUES ('phy', 'Physique', 'Physics', false);
INSERT INTO matieres VALUES ('litte', 'Litterature', 'Litterature', false);
INSERT INTO matieres VALUES ('info', 'Informatique', 'Informatique', false);
INSERT INTO matieres VALUES ('geo', 'Géographie', 'Géographie', false);
INSERT INTO matieres VALUES ('his', 'Histoire', 'History', false);
INSERT INTO matieres VALUES ('ang', 'Anglais', 'English', false);
INSERT INTO matieres VALUES ('fra', 'Français', 'French', false);
INSERT INTO matieres VALUES ('comp', 'Comptabilité', 'Compta', false);
INSERT INTO matieres VALUES ('svt', 'S.V.T', 'svt', false);
INSERT INTO matieres VALUES ('sprt', 'Sport', 'Sport', false);
INSERT INTO matieres VALUES ('phi', 'Philosophie', 'Philosophy', false);


--
-- TOC entry 2367 (class 0 OID 560791)
-- Dependencies: 199
-- Data for Name: mentions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mentions VALUES ('ab', 'Assez-bien', 'Average', false);
INSERT INTO mentions VALUES ('b', 'Bien', 'Good', false);
INSERT INTO mentions VALUES ('ex', 'Excellent', 'Excelent', false);
INSERT INTO mentions VALUES ('p', 'Passable', 'passable', false);
INSERT INTO mentions VALUES ('tb', 'Très bien', 'Very good', false);


--
-- TOC entry 2377 (class 0 OID 562772)
-- Dependencies: 209
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO message VALUES ('msg1', '15I00001', 'Universite', '2018-04-30', NULL, NULL, NULL, 'Lorem ipsum represents a long-held tradition for designers, typographers and the like. Some people hate it and argue for its demise, but others ignore the hate as they create awesome tools to help create filler text for everyone from bacon lovers to Charlie Sheen fans. ', NULL, NULL);
INSERT INTO message VALUES ('msg2', '15I00222', 'Universite', '2018-04-30', NULL, NULL, NULL, 'help create filler text for everyone from bacon lovers to Charlie Sheen fans. ', NULL, NULL);
INSERT INTO message VALUES ('msg3', '15I00222', 'UBA', '2018-04-29', NULL, NULL, NULL, 'Lorem ipsum represents a long-held tradition for designers, typographers and  others ignore the hate as they create awesome tools toon lovers to Charlie Sheen fans. ', NULL, NULL);
INSERT INTO message VALUES ('msg4', '15I00222', 'AE', '2018-04-28', NULL, NULL, NULL, 'but others ignore the hate as they create awesome tools to help create filler text for everyone from bacon lovers to Charlie Sheen fans. ', NULL, NULL);
INSERT INTO message VALUES ('msg5', '15I00001', 'Directeur', '2018-02-15', NULL, NULL, NULL, 'awesome tools to help create filler text for everyone from bacon lovers to Charlie Sheen fans. ', NULL, NULL);


--
-- TOC entry 2378 (class 0 OID 562778)
-- Dependencies: 210
-- Data for Name: message_preins; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO message_preins VALUES ('msg2', 'Service SCOLARITÉ', '2018-05-04', NULL, NULL, 'Salut Mr. Willfreid PENJA,

Nous te snjnkmzxc mz ks df kscskxjnksc skcjnmsxc zxckmzx czxckjzmxczkxmc xzcokme rqomqew fqjnmn q sdfqkdfnqksdfskdafaksmdfasdfnkasdf  aksdf.
adfjjkaff,an fsdjfkamd,aksdfnajksdf askjdnfasfasdf, jasdfnkadfa akjsfnas asdfjka,sdfasdf, aksfjaksfnkasdmnfasdf.

asdfjkasdfasf, aodlfasd  a,asfklasfda sfaos ,asdfam , a slkdfasdfklasm.

akjsdfaksfasdf, asdf.', true, NULL, NULL);
INSERT INTO message_preins VALUES ('msg3', 'Service SCOLARITÉ', '2018-05-04', NULL, NULL, 'Salut Mlle Vanessa BIYA,

JK,df dfokdl  , sdfmklvx,cvcxv kv,m xvcnjxmc vzxcvzmxcv zxmcv kcvcx, kvcmzkcv scvasvjmdvvxczvxcv,mlkvmzxckv cvzxcvcvxzcv, maoklm qpfo m.

asfdiklasdfmlasdfmfd ,asofdkldf , af apsflfdsadf, asofklasfsdmfnpoklmf, asfdkslf,mk, asdfklasm asfadf saofasdmfm, asdfkp. adfsmlasdf fdfklaflsdfdf, aopsfks sfkasdfldf . asfodaslfkaspdfa.

asdfiklasdfl, aasdfola.', true, NULL, NULL);
INSERT INTO message_preins VALUES ('msg1', 'UBA', '2018-04-30', NULL, NULL, 'Bsr colisbnn, jiuis soiulls enuitsm lao, nodut. Psuo, sury iuotpatr, yuiot, dut, kway bien do gsajmn, ammisnimn. 
UIjskk oepk, loosk, opjjsse entdidn apoue guive kesn quesjon,  spkjk.
Thodk , jdmm, lsoijnlorejn lorensi khjlosrbb jkjspoeub eta iole m ;al aoljbkl sdcj.', false, NULL, NULL);
INSERT INTO message_preins VALUES ('msg5', 'Administration', '2018-05-07', NULL, NULL, '<p>Hello Mlle Vanessa BIYA,</p>
<p>Weikj''sdm okmls, df spoxlmc ,zxcmlzxc.z cokzlx zxoc lkomlzxczx, okalmfa sfd ,sadofkasdf <b>sokdl sdofkl owejem</b> oksldsdfklmcasdf.</p>
<p>Pokms okmdfoskdfs f,sadf ,''fa sad;f''asdfm,: kflm,smf kl .klmds,! lsd <i>oipjewnk weoklm</i> skpclzxn OZKc XZcoXZcZXCj okn <b>IKLS WPODWD</b></p>
<p>Bkjdm, bye!</p>', false, NULL, NULL);
INSERT INTO message_preins VALUES ('msg6', 'Administration', '2018-05-07', NULL, NULL, '<p>Hello Mr Willfreid PENJA,</p>
<p>Weikj''sdm okmls, df spoxlmc ,zxcmlzxc.z cokzlx zxoc lkomlzxczx, okalmfa sfd ,sadofkasdf <b>sokdl sdofkl owejem</b> oksldsdfklmcasdf.</p>
<p>Pokms okmdfoskdfs f,sadf ,''fa sad;f''asdfm,: kflm,smf kl .klmds,! lsd <i>oipjewnk weoklm</i> skpclzxn OZKc XZcoXZcZXCj okn <b>IKLS WPODWD</b></p>
<p>Bkjdm, bye!</p>', false, NULL, NULL);


--
-- TOC entry 2368 (class 0 OID 560797)
-- Dependencies: 200
-- Data for Name: niveau; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO niveau VALUES ('D1', 'D1', 'D');
INSERT INTO niveau VALUES ('D2', 'D2', 'D');
INSERT INTO niveau VALUES ('D3', 'D3', 'D');
INSERT INTO niveau VALUES ('L1', 'L1', 'L');
INSERT INTO niveau VALUES ('L2', 'L2', 'L');
INSERT INTO niveau VALUES ('L3', 'L3', 'L');
INSERT INTO niveau VALUES ('M1', 'M1', 'M');
INSERT INTO niveau VALUES ('M2', 'M2', 'M');


--
-- TOC entry 2359 (class 0 OID 560740)
-- Dependencies: 191
-- Data for Name: pays; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pays VALUES ('CMR', 'Republic of Cameroon', 'Republique du Cameroun');
INSERT INTO pays VALUES ('BFA', 'Burkina Faso', 'Burkina Faso');
INSERT INTO pays VALUES ('USA', 'United States', 'États-Unis');
INSERT INTO pays VALUES ('TGO', 'Togo', 'Togo');
INSERT INTO pays VALUES ('NER', 'Niger', 'Niger');
INSERT INTO pays VALUES ('NGA', 'Nigeria', 'Nigéria');
INSERT INTO pays VALUES ('MLI', 'Mali', 'Mali');
INSERT INTO pays VALUES ('CIV', 'Côte d''Ivoire', 'Côte d''Ivoire');
INSERT INTO pays VALUES ('GAB', 'Gabon', 'Gabon');
INSERT INTO pays VALUES ('GNQ', 'Equatorial Guinea', 'Guinée Équatoriale');
INSERT INTO pays VALUES ('COG', 'Republic of the Congo', 'République du Congo');
INSERT INTO pays VALUES ('COD', 'The Democratic Republic Of The Congo', 'République Démocratique du Congo');
INSERT INTO pays VALUES ('RCA', 'Central African', 'République Centrafricaine');
INSERT INTO pays VALUES ('TCD', 'Chad', 'Tchad');


--
-- TOC entry 2379 (class 0 OID 562784)
-- Dependencies: 211
-- Data for Name: piece_dossier; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 212
-- Name: piece_dossier_idpiece_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('piece_dossier_idpiece_seq', 1, false);


--
-- TOC entry 2381 (class 0 OID 562792)
-- Dependencies: 213
-- Data for Name: preins_diplome; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO preins_diplome VALUES ('bacc', 15, '2017', 'IUT DOUALA', NULL);


--
-- TOC entry 2382 (class 0 OID 562798)
-- Dependencies: 214
-- Data for Name: preins_matiere; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO preins_matiere VALUES ('math', 15, '10', NULL);


--
-- TOC entry 2383 (class 0 OID 562804)
-- Dependencies: 215
-- Data for Name: preinscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO preinscription VALUES (9, 'SCHL1', NULL, 'F', 'Vanessa BIYA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'vanessa', 'biya', NULL, NULL, NULL, NULL, NULL);
INSERT INTO preinscription VALUES (1, 'SCHL1', '2018/2019', 'M', 'Wilfreid PENJA', '1993-11-25', '2018/2019', 'Bonaberi', 'Douala', 'CMR', 'LT', 'WOUR', 'fr', 'en', '698645102', 'will12@yahoo.com', 'Celibataire', '1', NULL, NULL, NULL, 'bacc', 'c', 'ab', '2015', 'CMR', 'Lycee d''AKWA', 'Agent Commercial', false, NULL, 'mus', 'jeuv', true, 'foo', 'gymn', 'Patrick MBOMA', '+11585110220425', 'Pierre CURIE', '+007879542259', 'Marie CURIE', '+007812521535', '2018-04-30', NULL, NULL, false, NULL, '03/05/2018', 'L', NULL, '12/05/2018', NULL, NULL, NULL, NULL, 'IUT', '15879874130', 'mboma-patrick@gmail.com', 'will1', 'will1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO preinscription VALUES (10, NULL, NULL, 'H', 'medjignia ', '1987-07-20', NULL, '', 'DOUALA', 'CMR', 'CE', 'HTSN', 'fr', 'fr', '674591421', 'mendjijet@yahoo.fr', 'Celibataire', '1', 'BTS_COM_VENTE', 'BTS_COM_VENTE', NULL, 'bacc', 'a', 'ab', '2009', NULL, 'LYCEE MBANGA', NULL, false, NULL, 'voy', 'voy', true, 'foo', 'foo', 'medjignia', '674591421', 'medjignia mere', '65897852255', NULL, '698521151', NULL, NULL, NULL, NULL, NULL, NULL, 'B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123756982', 'mendjijet@yahoo.fr', NULL, NULL, true, true, 'jelly roll', '2701 DOUALA', '');
INSERT INTO preinscription VALUES (11, NULL, NULL, 'H', 'tryrtty', '2018-05-20', NULL, '', 'tryrtyrtyrty', 'CMR', 'AD', NULL, 'fr', 'fr', '', '', 'Celibataire', '1', 'BTS_COM_VENTE', 'BTS_COM_VENTE', NULL, 'bacc', 'a', 'ab', '', NULL, '', NULL, false, NULL, 'voy', 'voy', true, 'foo', 'foo', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, true, true, 'tryrtytryrt', '', '');
INSERT INTO preinscription VALUES (12, NULL, NULL, 'H', 'gghgfh', '2018-05-20', NULL, 'gfhgfhgfhgfh', 'hfghgfhgfhf', 'CMR', 'AD', 'DJRM', 'fr', 'fr', '', '', 'Celibataire', '1', 'BTS_COM_VENTE', 'BTS_RES_TELECOM', NULL, 'bacc', 'c', 'ab', '2009', NULL, 'dsfsdfsdfdsfds', NULL, false, NULL, 'voy', 'voy', true, 'foo', 'foo', 'dsfdsf', 'fsdfdsf', 'fdsfsdfdsfd', 'fdsfdsf', NULL, 'sdfdsf', NULL, NULL, NULL, NULL, NULL, NULL, 'B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'dsfdfdf', NULL, NULL, true, true, 'jhgjhgjhgjgjhgj', '', '');
INSERT INTO preinscription VALUES (13, NULL, NULL, 'H', 'fdgdfg', '2018-05-14', NULL, 'fdgfdgdfgfdg', 'gfdgdfgfdgdfg', 'CMR', 'SU', 'DJLB', 'fr', 'fr', 'dfgdfgf', 'dfgfd', 'Celibataire', '1', 'BTS_RES_TELECOM', 'BTS_COM_VENTE', NULL, 'bacc', 'c', 'ab', 'gfdg', NULL, 'fdgfdgdfgdfgd', NULL, false, NULL, 'voy', 'voy', true, 'foo', 'foo', 'gdfg', 'dfgdf', 'gdfg', 'fdgdf', NULL, 'fdgdfg', NULL, NULL, NULL, NULL, NULL, NULL, 'B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dgfgfdgfgdfgdg', 'gfdgfdg', NULL, NULL, true, true, 'dfgdfgdfg', 'gfdgdfgfdg', 'gfdgfdgfdgdfg');
INSERT INTO preinscription VALUES (14, NULL, NULL, 'H', 'fdgdfg', '2018-05-13', NULL, 'gfhgfhgfhgfh', 'gfdgdfgfdgdfg', 'CMR', 'OU', 'BTOS', 'fr', 'fr', 'dfgdfgf', 'dfgfd', 'Celibataire', '1', 'BTS_RES_TELECOM', 'BTS_RES_TELECOM', NULL, 'bacc', 'a', 'ab', '2009', NULL, 'LYCEE MBANGA', NULL, false, NULL, 'voy', 'voy', true, 'foo', 'foo', 'cxvcxvcxv', 'cxvxcvxc', 'xcvxc', 'vxcvxc', NULL, 'vxcvxv', NULL, NULL, NULL, NULL, NULL, NULL, 'B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dgfgfdgfgdfgdg', 'xcvxcvxcv', NULL, NULL, true, true, 'jhgjhgjhgjgjhgj', 'gfdgdfgfdg', '');
INSERT INTO preinscription VALUES (15, NULL, NULL, 'H', 'gghgfh', '2018-05-21', NULL, 'gfhgfhgfhgfh', 'hfghgfhgfhf', 'CMR', 'OU', 'BTOS', 'fr', 'fr', 'dfgdfgf', 'dfgfd', 'Celibataire', '1', 'BTS_COM_VENTE', 'BTS_RES_TELECOM', NULL, 'bacc', 'a', 'ab', '2009', NULL, 'LYCEE MBANGA', NULL, false, NULL, 'voy', 'voy', true, 'foo', 'foo', 'ggfhgfhgf', 'hgfhgfh', 'hgfhg', 'fhgfh', NULL, 'gfhgfhgfhgf', NULL, NULL, NULL, NULL, NULL, NULL, 'B', NULL, NULL, NULL, NULL, NULL, '18000015', NULL, 'dgfgfdgfgdfgdg', 'gfhgfhgf', NULL, 'm6535', true, true, 'dfgdfgdfg', 'gfdgdfgfdg', '');


--
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 216
-- Name: preinscription_idpreins_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('preinscription_idpreins_seq', 15, true);


--
-- TOC entry 2360 (class 0 OID 560745)
-- Dependencies: 192
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO region VALUES ('AD', 'CMR', 'Adamaoua', 'Adamaoua');
INSERT INTO region VALUES ('CE', 'CMR', 'Centre', 'Center');
INSERT INTO region VALUES ('ES', 'CMR', 'Est', 'East');
INSERT INTO region VALUES ('EN', 'CMR', 'Extreme Nord', 'Far North');
INSERT INTO region VALUES ('LT', 'CMR', 'Littoral', 'Littoral');
INSERT INTO region VALUES ('NO', 'CMR', 'Nord', 'North');
INSERT INTO region VALUES ('OU', 'CMR', 'Ouest', 'West');
INSERT INTO region VALUES ('NW', 'CMR', 'Nord Ouest', 'North West');
INSERT INTO region VALUES ('SU', 'CMR', 'Sud', 'South');
INSERT INTO region VALUES ('SW', 'CMR', 'Sud Ouest', 'South West');


--
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 185
-- Name: seqclass; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seqclass', 9, true);


--
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 184
-- Name: seqmat; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seqmat', 42, true);


--
-- TOC entry 2369 (class 0 OID 560800)
-- Dependencies: 201
-- Data for Name: sports; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sports VALUES ('foo', 'FootBall', 'FootBall', false);
INSERT INTO sports VALUES ('bas', 'Basketball', 'Basketball', false);
INSERT INTO sports VALUES ('ath', 'Athletisme', 'Athletism', false);
INSERT INTO sports VALUES ('ten', 'Tenis', 'Tenis', false);
INSERT INTO sports VALUES ('judo', 'Judo', 'Judo', false);
INSERT INTO sports VALUES ('boxe', 'Boxe', 'Boxe', false);
INSERT INTO sports VALUES ('gymn', 'Gymnastique', 'Gymnastic', false);
INSERT INTO sports VALUES ('*', 'Autres', 'Autres', false);


--
-- TOC entry 2347 (class 0 OID 460959)
-- Dependencies: 179
-- Data for Name: suivre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO suivre VALUES ('13S00000', 15, '16:36', '18:08', 'RAS', '2017-11-20');
INSERT INTO suivre VALUES ('13S00000', 16, '20:47', '20:48', 'RAS', '2017-11-20');
INSERT INTO suivre VALUES ('13S00000', 19, '11:09', '11:10', 'RAS', '2017-11-30');
INSERT INTO suivre VALUES ('13S00000', 22, '15:26', '15:26', 'RAS', '2018-04-16');
INSERT INTO suivre VALUES ('13S00000', 21, '18:46', NULL, 'RAS', '2018-04-16');


--
-- TOC entry 2373 (class 0 OID 560858)
-- Dependencies: 205
-- Data for Name: tableenrol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tableenrol VALUES ('18IS00152', 'MEDJIGNIA', 'JELLY', '20/07/1980', 'NANGA-EBOKO', 'M', '674591421', 'mendjijet@yahoo.fr', '123458792', 'M', 'NH', 'N', '36', '2', 'fr', 'az', 'issam', false, 187, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 2357 (class 0 OID 550515)
-- Dependencies: 189
-- Data for Name: tabpers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tabpers VALUES ('jel', 'erezrzerze', 'ezrzerzerekkfjsdf', 5);
INSERT INTO tabpers VALUES ('mendjijet', 'jellly roll', 'mendjijet teint black', 7);
INSERT INTO tabpers VALUES ('mendjijet', 'jellly roll', 'mendjijet teint black', 8);
INSERT INTO tabpers VALUES ('ghijbvcff', 'ghujjhhggg', 'ggyuhbhh', 9);
INSERT INTO tabpers VALUES ('jet', 'jetttt', 'jettt etetet', 16);
INSERT INTO tabpers VALUES ('mendjijet', 'jellly roll', 'mendjijet teint black', 17);
INSERT INTO tabpers VALUES ('mendjijet', 'jellly roll', 'mendjijet teint black', 18);
INSERT INTO tabpers VALUES ('université', 'Douala Ange Raphaël', 'campus un essec', 20);
INSERT INTO tabpers VALUES ('ondaphe', 'arthur', 'le gros', 15);
INSERT INTO tabpers VALUES ('yyyyyy', 'yyyyyy', 'uuuuuuuu', 21);
INSERT INTO tabpers VALUES ('ouyhvbjbv', 'vbxkkxjxj,', 'vbxjxkxkxjgd', 22);


--
-- TOC entry 2404 (class 0 OID 0)
-- Dependencies: 188
-- Name: tabpers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tabpers_id_seq', 22, true);


--
-- TOC entry 2370 (class 0 OID 560806)
-- Dependencies: 202
-- Data for Name: type_bacc; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO type_bacc VALUES ('a', 'A', 'A', false);
INSERT INTO type_bacc VALUES ('b', 'B', 'B', false);
INSERT INTO type_bacc VALUES ('c', 'C', 'C', false);
INSERT INTO type_bacc VALUES ('d', 'D', 'D', false);
INSERT INTO type_bacc VALUES ('e', 'E', 'E', false);
INSERT INTO type_bacc VALUES ('f', 'F', 'F', false);
INSERT INTO type_bacc VALUES ('g', 'G', 'G', false);
INSERT INTO type_bacc VALUES ('s', 'S', 'S', false);
INSERT INTO type_bacc VALUES ('TI', 'TI', 'TI', false);
INSERT INTO type_bacc VALUES ('esf', 'ESF', 'ESF', false);
INSERT INTO type_bacc VALUES ('ih', 'IH', 'IH', false);


--
-- TOC entry 2343 (class 0 OID 460870)
-- Dependencies: 175
-- Data for Name: type_formation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO type_formation VALUES ('1', 'INITIALE');
INSERT INTO type_formation VALUES ('2', 'PROFESSIONNELLE');
INSERT INTO type_formation VALUES ('3', 'CPS');


--
-- TOC entry 2371 (class 0 OID 560812)
-- Dependencies: 203
-- Data for Name: type_paiement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO type_paiement VALUES ('pr   ', 'Préinscriptions                         ', false);
INSERT INTO type_paiement VALUES ('insc ', 'Inscription                             ', false);
INSERT INTO type_paiement VALUES ('T1   ', 'INSCRIPTION  - TRANCHE 1                ', false);
INSERT INTO type_paiement VALUES ('T2   ', 'INSCRIPTION  - TRANCHE 2                ', false);
INSERT INTO type_paiement VALUES ('C1   ', 'CARTE ETUDIANT                          ', false);
INSERT INTO type_paiement VALUES ('VM   ', 'VISITE MEDICALE                         ', false);
INSERT INTO type_paiement VALUES ('RV   ', 'RECOUVREMENT                            ', false);


--
-- TOC entry 2114 (class 2606 OID 469185)
-- Name: PK_classe; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classe
    ADD CONSTRAINT "PK_classe" PRIMARY KEY (idclasse);


--
-- TOC entry 2108 (class 2606 OID 460917)
-- Name: PK_cours; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cours
    ADD CONSTRAINT "PK_cours" PRIMARY KEY (idcours);


--
-- TOC entry 2116 (class 2606 OID 469193)
-- Name: PK_departement; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departement
    ADD CONSTRAINT "PK_departement" PRIMARY KEY (iddepartement);


--
-- TOC entry 2110 (class 2606 OID 469246)
-- Name: PK_enseigne; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseigne
    ADD CONSTRAINT "PK_enseigne" PRIMARY KEY (matricule, idcours);


--
-- TOC entry 2122 (class 2606 OID 510140)
-- Name: PK_inscription; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscription
    ADD CONSTRAINT "PK_inscription" PRIMARY KEY (idinscription);


--
-- TOC entry 2120 (class 2606 OID 469224)
-- Name: PK_matiere; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matiere
    ADD CONSTRAINT "PK_matiere" PRIMARY KEY (idmatiere);


--
-- TOC entry 2118 (class 2606 OID 469202)
-- Name: PK_matricule; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseignant
    ADD CONSTRAINT "PK_matricule" PRIMARY KEY (matricule);


--
-- TOC entry 2124 (class 2606 OID 550523)
-- Name: PK_pers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tabpers
    ADD CONSTRAINT "PK_pers" PRIMARY KEY (id);


--
-- TOC entry 2112 (class 2606 OID 460966)
-- Name: PK_suivre; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY suivre
    ADD CONSTRAINT "PK_suivre" PRIMARY KEY (matricule, idcours);


--
-- TOC entry 2159 (class 2606 OID 562816)
-- Name: admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY administrateur
    ADD CONSTRAINT admin_pkey PRIMARY KEY (matricule);


--
-- TOC entry 2132 (class 2606 OID 560760)
-- Name: departementgeographique_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departement_geographique
    ADD CONSTRAINT departementgeographique_pkey PRIMARY KEY (codedepartementgeographique);


--
-- TOC entry 2134 (class 2606 OID 560817)
-- Name: diplomes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY diplomes
    ADD CONSTRAINT diplomes_pkey PRIMARY KEY (iddiplome);


--
-- TOC entry 2161 (class 2606 OID 562818)
-- Name: ecole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ecole
    ADD CONSTRAINT ecole_pkey PRIMARY KEY (codeecole);


--
-- TOC entry 2155 (class 2606 OID 560857)
-- Name: empreintes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empreinte
    ADD CONSTRAINT empreintes PRIMARY KEY (num_doigt);


--
-- TOC entry 2163 (class 2606 OID 562820)
-- Name: filiere_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filiere
    ADD CONSTRAINT filiere_pkey PRIMARY KEY (codefilere);


--
-- TOC entry 2136 (class 2606 OID 560819)
-- Name: handicaps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY handicaps
    ADD CONSTRAINT handicaps_pkey PRIMARY KEY (idhandicap);


--
-- TOC entry 2126 (class 2606 OID 560734)
-- Name: idcycle; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cycles
    ADD CONSTRAINT idcycle PRIMARY KEY (idcycle);


--
-- TOC entry 2153 (class 2606 OID 560821)
-- Name: idtypepaiement; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY type_paiement
    ADD CONSTRAINT idtypepaiement PRIMARY KEY (idtypepaiement);


--
-- TOC entry 2138 (class 2606 OID 560823)
-- Name: langues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY langues
    ADD CONSTRAINT langues_pkey PRIMARY KEY (idlangue);


--
-- TOC entry 2140 (class 2606 OID 560825)
-- Name: loisirs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY loisirs
    ADD CONSTRAINT loisirs_pkey PRIMARY KEY (idloisir);


--
-- TOC entry 2142 (class 2606 OID 560827)
-- Name: matieres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matieres
    ADD CONSTRAINT matieres_pkey PRIMARY KEY (idmatiere);


--
-- TOC entry 2144 (class 2606 OID 560829)
-- Name: mentions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mentions
    ADD CONSTRAINT mentions_pkey PRIMARY KEY (idmention);


--
-- TOC entry 2165 (class 2606 OID 562822)
-- Name: message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY message
    ADD CONSTRAINT message_pkey PRIMARY KEY (idmessage);


--
-- TOC entry 2168 (class 2606 OID 562824)
-- Name: message_preins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY message_preins
    ADD CONSTRAINT message_preins_pkey PRIMARY KEY (idmessage);


--
-- TOC entry 2147 (class 2606 OID 560831)
-- Name: niveau_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY niveau
    ADD CONSTRAINT niveau_pk PRIMARY KEY (code_niveau);


--
-- TOC entry 2128 (class 2606 OID 560744)
-- Name: pays_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pays
    ADD CONSTRAINT pays_pkey PRIMARY KEY (codepays);


--
-- TOC entry 2170 (class 2606 OID 562826)
-- Name: piece_dossier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY piece_dossier
    ADD CONSTRAINT piece_dossier_pkey PRIMARY KEY (idpiece);


--
-- TOC entry 2104 (class 2606 OID 460869)
-- Name: pk_annee_academique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY annee_academique
    ADD CONSTRAINT pk_annee_academique PRIMARY KEY (idannee);


--
-- TOC entry 2102 (class 2606 OID 460861)
-- Name: pk_etudiant; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY etudiant
    ADD CONSTRAINT pk_etudiant PRIMARY KEY (matricule);


--
-- TOC entry 2106 (class 2606 OID 460877)
-- Name: pk_formation; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY type_formation
    ADD CONSTRAINT pk_formation PRIMARY KEY (idformation);


--
-- TOC entry 2130 (class 2606 OID 560752)
-- Name: pk_region; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY region
    ADD CONSTRAINT pk_region PRIMARY KEY (coderegion);


--
-- TOC entry 2157 (class 2606 OID 560865)
-- Name: pktable; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tableenrol
    ADD CONSTRAINT pktable PRIMARY KEY (matricule);


--
-- TOC entry 2172 (class 2606 OID 562828)
-- Name: preins_diplome_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preins_diplome
    ADD CONSTRAINT preins_diplome_pkey PRIMARY KEY (iddiplome, idpreins);


--
-- TOC entry 2174 (class 2606 OID 562830)
-- Name: preins_matiere_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preins_matiere
    ADD CONSTRAINT preins_matiere_pkey PRIMARY KEY (idmatiere, idpreins);


--
-- TOC entry 2177 (class 2606 OID 562832)
-- Name: preinscription_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT preinscription_login_key UNIQUE (login);


--
-- TOC entry 2179 (class 2606 OID 562834)
-- Name: preinscription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT preinscription_pkey PRIMARY KEY (idpreins);


--
-- TOC entry 2149 (class 2606 OID 560833)
-- Name: sports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sports
    ADD CONSTRAINT sports_pkey PRIMARY KEY (idsport);


--
-- TOC entry 2151 (class 2606 OID 560835)
-- Name: typebacc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY type_bacc
    ADD CONSTRAINT typebacc_pkey PRIMARY KEY (idtypebacc);


--
-- TOC entry 2166 (class 1259 OID 563060)
-- Name: FKI_Preins_message; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FKI_Preins_message" ON message_preins USING btree (idpreins);


--
-- TOC entry 2175 (class 1259 OID 563091)
-- Name: FKI_type_bacc_preins; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FKI_type_bacc_preins" ON preinscription USING btree (typebacc);


--
-- TOC entry 2145 (class 1259 OID 560836)
-- Name: niveau_cycles_fk_i; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX niveau_cycles_fk_i ON niveau USING btree (code_niveau);


--
-- TOC entry 2231 (class 2620 OID 469250)
-- Name: trggenerateidmatiere; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trggenerateidmatiere BEFORE INSERT ON matiere FOR EACH ROW EXECUTE PROCEDURE generateidmatiere();


--
-- TOC entry 2230 (class 2620 OID 469259)
-- Name: triggenerateidclasse; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER triggenerateidclasse BEFORE INSERT ON classe FOR EACH ROW EXECUTE PROCEDURE generateidclasse();


--
-- TOC entry 2203 (class 2606 OID 563055)
-- Name: FK_Preins_message; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY message_preins
    ADD CONSTRAINT "FK_Preins_message" FOREIGN KEY (idpreins) REFERENCES preinscription(idpreins);


--
-- TOC entry 2195 (class 2606 OID 510156)
-- Name: FK_annee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscription
    ADD CONSTRAINT "FK_annee" FOREIGN KEY (idannee) REFERENCES annee_academique(idannee);


--
-- TOC entry 2180 (class 2606 OID 460928)
-- Name: FK_anneecademique; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cours
    ADD CONSTRAINT "FK_anneecademique" FOREIGN KEY (idannee) REFERENCES annee_academique(idannee);


--
-- TOC entry 2225 (class 2606 OID 563066)
-- Name: FK_choixform_prein1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_choixform_prein1" FOREIGN KEY (choixformation1) REFERENCES filiere(codefilere);


--
-- TOC entry 2226 (class 2606 OID 563071)
-- Name: FK_choixform_prein2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_choixform_prein2" FOREIGN KEY (choixformation2) REFERENCES filiere(codefilere);


--
-- TOC entry 2227 (class 2606 OID 563076)
-- Name: FK_choixform_prein3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_choixform_prein3" FOREIGN KEY (choixformation3) REFERENCES filiere(codefilere);


--
-- TOC entry 2182 (class 2606 OID 469230)
-- Name: FK_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cours
    ADD CONSTRAINT "FK_classe" FOREIGN KEY (idclasse) REFERENCES classe(idclasse);


--
-- TOC entry 2194 (class 2606 OID 510151)
-- Name: FK_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscription
    ADD CONSTRAINT "FK_classe" FOREIGN KEY (idclasse) REFERENCES classe(idclasse);


--
-- TOC entry 2189 (class 2606 OID 460972)
-- Name: FK_cours; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY suivre
    ADD CONSTRAINT "FK_cours" FOREIGN KEY (idcours) REFERENCES cours(idcours);


--
-- TOC entry 2187 (class 2606 OID 469240)
-- Name: FK_cours; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseigne
    ADD CONSTRAINT "FK_cours" FOREIGN KEY (idcours) REFERENCES cours(idcours);


--
-- TOC entry 2199 (class 2606 OID 562840)
-- Name: FK_cycle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filiere
    ADD CONSTRAINT "FK_cycle" FOREIGN KEY (cycles) REFERENCES cycles(idcycle);


--
-- TOC entry 2228 (class 2606 OID 563081)
-- Name: FK_cycles_preins; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_cycles_preins" FOREIGN KEY (cycles) REFERENCES cycles(idcycle);


--
-- TOC entry 2191 (class 2606 OID 469225)
-- Name: FK_departement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matiere
    ADD CONSTRAINT "FK_departement" FOREIGN KEY (iddepartement) REFERENCES departement(iddepartement);


--
-- TOC entry 2190 (class 2606 OID 469251)
-- Name: FK_departement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classe
    ADD CONSTRAINT "FK_departement" FOREIGN KEY (iddepartement) REFERENCES departement(iddepartement);


--
-- TOC entry 2184 (class 2606 OID 477381)
-- Name: FK_departement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cours
    ADD CONSTRAINT "FK_departement" FOREIGN KEY (iddepartement) REFERENCES departement(iddepartement);


--
-- TOC entry 2209 (class 2606 OID 562845)
-- Name: FK_departementgeographoque; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_departementgeographoque" FOREIGN KEY (departementgeographique) REFERENCES departement_geographique(codedepartementgeographique);


--
-- TOC entry 2205 (class 2606 OID 562850)
-- Name: FK_diplome; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preins_diplome
    ADD CONSTRAINT "FK_diplome" FOREIGN KEY (iddiplome) REFERENCES diplomes(iddiplome);


--
-- TOC entry 2210 (class 2606 OID 562860)
-- Name: FK_diplomedadmission; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_diplomedadmission" FOREIGN KEY (diplomeadmission) REFERENCES diplomes(iddiplome);


--
-- TOC entry 2200 (class 2606 OID 562865)
-- Name: FK_ecole; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filiere
    ADD CONSTRAINT "FK_ecole" FOREIGN KEY (ecole) REFERENCES ecole(codeecole);


--
-- TOC entry 2211 (class 2606 OID 562870)
-- Name: FK_ecole; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_ecole" FOREIGN KEY (ecole) REFERENCES ecole(codeecole);


--
-- TOC entry 2185 (class 2606 OID 493745)
-- Name: FK_enseignant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cours
    ADD CONSTRAINT "FK_enseignant" FOREIGN KEY (matricule) REFERENCES enseignant(matricule);


--
-- TOC entry 2186 (class 2606 OID 469212)
-- Name: FK_enseigne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY enseigne
    ADD CONSTRAINT "FK_enseigne" FOREIGN KEY (matricule) REFERENCES enseignant(matricule);


--
-- TOC entry 2188 (class 2606 OID 460967)
-- Name: FK_etudiant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY suivre
    ADD CONSTRAINT "FK_etudiant" FOREIGN KEY (matricule) REFERENCES etudiant(matricule);


--
-- TOC entry 2192 (class 2606 OID 510141)
-- Name: FK_etudiant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscription
    ADD CONSTRAINT "FK_etudiant" FOREIGN KEY (matricule) REFERENCES etudiant(matricule);


--
-- TOC entry 2202 (class 2606 OID 562875)
-- Name: FK_etudiant; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY message
    ADD CONSTRAINT "FK_etudiant" FOREIGN KEY (idetudiant) REFERENCES etudiant(matricule);


--
-- TOC entry 2204 (class 2606 OID 562880)
-- Name: FK_filiere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY piece_dossier
    ADD CONSTRAINT "FK_filiere" FOREIGN KEY (codefiliere) REFERENCES filiere(codefilere);


--
-- TOC entry 2193 (class 2606 OID 510146)
-- Name: FK_formation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscription
    ADD CONSTRAINT "FK_formation" FOREIGN KEY (idformation) REFERENCES type_formation(idformation);


--
-- TOC entry 2212 (class 2606 OID 562920)
-- Name: FK_langue1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_langue1" FOREIGN KEY (lang1) REFERENCES langues(idlangue);


--
-- TOC entry 2213 (class 2606 OID 562925)
-- Name: FK_langue2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_langue2" FOREIGN KEY (lang2) REFERENCES langues(idlangue);


--
-- TOC entry 2214 (class 2606 OID 562955)
-- Name: FK_loisir1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_loisir1" FOREIGN KEY (loisir1) REFERENCES loisirs(idloisir);


--
-- TOC entry 2215 (class 2606 OID 562960)
-- Name: FK_losir2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_losir2" FOREIGN KEY (loisir2) REFERENCES loisirs(idloisir);


--
-- TOC entry 2183 (class 2606 OID 469235)
-- Name: FK_matiere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cours
    ADD CONSTRAINT "FK_matiere" FOREIGN KEY (id_matiere) REFERENCES matiere(idmatiere);


--
-- TOC entry 2207 (class 2606 OID 562965)
-- Name: FK_matiere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preins_matiere
    ADD CONSTRAINT "FK_matiere" FOREIGN KEY (idmatiere) REFERENCES matieres(idmatiere);


--
-- TOC entry 2216 (class 2606 OID 562975)
-- Name: FK_mention; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_mention" FOREIGN KEY (mention) REFERENCES mentions(idmention);


--
-- TOC entry 2217 (class 2606 OID 562980)
-- Name: FK_paysnationalite; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_paysnationalite" FOREIGN KEY (paysnationalite) REFERENCES pays(codepays);


--
-- TOC entry 2218 (class 2606 OID 562985)
-- Name: FK_paysobtentiondiplome; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_paysobtentiondiplome" FOREIGN KEY (paysobtentiondipl) REFERENCES pays(codepays);


--
-- TOC entry 2208 (class 2606 OID 562990)
-- Name: FK_preins; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preins_matiere
    ADD CONSTRAINT "FK_preins" FOREIGN KEY (idpreins) REFERENCES preinscription(idpreins);


--
-- TOC entry 2206 (class 2606 OID 562995)
-- Name: FK_preins; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preins_diplome
    ADD CONSTRAINT "FK_preins" FOREIGN KEY (idpreins) REFERENCES preinscription(idpreins);


--
-- TOC entry 2219 (class 2606 OID 563000)
-- Name: FK_region; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_region" FOREIGN KEY (region) REFERENCES region(coderegion);


--
-- TOC entry 2220 (class 2606 OID 563015)
-- Name: FK_sport1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_sport1" FOREIGN KEY (sport1) REFERENCES sports(idsport);


--
-- TOC entry 2221 (class 2606 OID 563020)
-- Name: FK_sport2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_sport2" FOREIGN KEY (sport2) REFERENCES sports(idsport);


--
-- TOC entry 2229 (class 2606 OID 563086)
-- Name: FK_type_bacc_preins; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_type_bacc_preins" FOREIGN KEY (typebacc) REFERENCES type_bacc(idtypebacc);


--
-- TOC entry 2222 (class 2606 OID 563030)
-- Name: FK_typebacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_typebacc" FOREIGN KEY (typebacc) REFERENCES type_bacc(idtypebacc);


--
-- TOC entry 2181 (class 2606 OID 460933)
-- Name: FK_typeformation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cours
    ADD CONSTRAINT "FK_typeformation" FOREIGN KEY (idformation) REFERENCES type_formation(idformation);


--
-- TOC entry 2201 (class 2606 OID 563035)
-- Name: FK_typeformation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filiere
    ADD CONSTRAINT "FK_typeformation" FOREIGN KEY (typeformation) REFERENCES type_formation(idformation);


--
-- TOC entry 2223 (class 2606 OID 563040)
-- Name: FK_typeformation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_typeformation" FOREIGN KEY (typeformation) REFERENCES type_formation(idformation);


--
-- TOC entry 2224 (class 2606 OID 563045)
-- Name: FK_typehandicap; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preinscription
    ADD CONSTRAINT "FK_typehandicap" FOREIGN KEY (typehandicap) REFERENCES handicaps(idhandicap);


--
-- TOC entry 2197 (class 2606 OID 560866)
-- Name: fk_dd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tableenrol
    ADD CONSTRAINT fk_dd FOREIGN KEY (numdoigtdroit) REFERENCES empreinte(num_doigt);


--
-- TOC entry 2198 (class 2606 OID 560871)
-- Name: fk_dg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tableenrol
    ADD CONSTRAINT fk_dg FOREIGN KEY (numdoigtgauche) REFERENCES empreinte(num_doigt);


--
-- TOC entry 2196 (class 2606 OID 560837)
-- Name: niveau_cycle_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY niveau
    ADD CONSTRAINT niveau_cycle_fk FOREIGN KEY (code_cycle) REFERENCES cycles(idcycle);


--
-- TOC entry 2391 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-05-28 16:06:42

--
-- PostgreSQL database dump complete
--

