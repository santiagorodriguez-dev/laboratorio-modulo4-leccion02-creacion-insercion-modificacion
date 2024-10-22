--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-10-22 19:31:13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE logistica;
--
-- TOC entry 4841 (class 1262 OID 16720)
-- Name: logistica; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE logistica WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';


\connect logistica

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16852)
-- Name: clientes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nombre character varying(100),
    email character varying(125),
    direccion character varying(175),
    telefono character varying(15),
    pais character varying(75),
    fecha_nacimiento date
);


--
-- TOC entry 215 (class 1259 OID 16851)
-- Name: clientes_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 215
-- Name: clientes_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;


--
-- TOC entry 226 (class 1259 OID 16960)
-- Name: detalle_envios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.detalle_envios (
    id_detalle integer NOT NULL,
    id_envio integer,
    producto character varying(125),
    cantidad integer,
    precio_unitario numeric(15,2)
);


--
-- TOC entry 225 (class 1259 OID 16959)
-- Name: detalle_envios_id_detalle_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.detalle_envios_id_detalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 225
-- Name: detalle_envios_id_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.detalle_envios_id_detalle_seq OWNED BY public.detalle_envios.id_detalle;


--
-- TOC entry 218 (class 1259 OID 16861)
-- Name: empleados; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.empleados (
    id_empleado integer NOT NULL,
    nombre_completo character varying(100),
    cargo character varying(40),
    email character varying(125),
    fecha_contrato date
);


--
-- TOC entry 217 (class 1259 OID 16860)
-- Name: empleados_id_empleado_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.empleados_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 217
-- Name: empleados_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.empleados_id_empleado_seq OWNED BY public.empleados.id_empleado;


--
-- TOC entry 224 (class 1259 OID 16925)
-- Name: envios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.envios (
    id_envio integer NOT NULL,
    id_cliente integer,
    id_empleado integer,
    id_proveedor integer,
    fecha_envio date,
    total numeric(12,2)
);


--
-- TOC entry 223 (class 1259 OID 16924)
-- Name: envios_id_envio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.envios_id_envio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 223
-- Name: envios_id_envio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.envios_id_envio_seq OWNED BY public.envios.id_envio;


--
-- TOC entry 220 (class 1259 OID 16868)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.proveedores (
    id_proveedor integer NOT NULL,
    nombre character varying(100),
    telefono character varying(25),
    direccion character varying(175),
    codigo_postal character varying(10)
);


--
-- TOC entry 219 (class 1259 OID 16867)
-- Name: proveedores_id_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.proveedores_id_proveedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 219
-- Name: proveedores_id_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.proveedores_id_proveedor_seq OWNED BY public.proveedores.id_proveedor;


--
-- TOC entry 222 (class 1259 OID 16917)
-- Name: regiones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.regiones (
    id_region integer NOT NULL,
    nombre character varying(100)
);


--
-- TOC entry 221 (class 1259 OID 16916)
-- Name: regiones_id_region_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.regiones_id_region_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 221
-- Name: regiones_id_region_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.regiones_id_region_seq OWNED BY public.regiones.id_region;


--
-- TOC entry 4659 (class 2604 OID 16855)
-- Name: clientes id_cliente; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);


--
-- TOC entry 4664 (class 2604 OID 16963)
-- Name: detalle_envios id_detalle; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detalle_envios ALTER COLUMN id_detalle SET DEFAULT nextval('public.detalle_envios_id_detalle_seq'::regclass);


--
-- TOC entry 4660 (class 2604 OID 16864)
-- Name: empleados id_empleado; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empleados ALTER COLUMN id_empleado SET DEFAULT nextval('public.empleados_id_empleado_seq'::regclass);


--
-- TOC entry 4663 (class 2604 OID 16928)
-- Name: envios id_envio; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.envios ALTER COLUMN id_envio SET DEFAULT nextval('public.envios_id_envio_seq'::regclass);


--
-- TOC entry 4661 (class 2604 OID 16871)
-- Name: proveedores id_proveedor; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proveedores ALTER COLUMN id_proveedor SET DEFAULT nextval('public.proveedores_id_proveedor_seq'::regclass);


--
-- TOC entry 4662 (class 2604 OID 16920)
-- Name: regiones id_region; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.regiones ALTER COLUMN id_region SET DEFAULT nextval('public.regiones_id_region_seq'::regclass);


--
-- TOC entry 4825 (class 0 OID 16852)
-- Dependencies: 216
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.clientes VALUES (1, 'Pepe Pérez', 'Pepe.perez@mail.com', 'Calle A, 123', '600312345', 'España', NULL);
INSERT INTO public.clientes VALUES (3, 'Juan Fernández', 'Juan.fernandez@mail.com', 'Avenida C, 789', '622512345', 'Portugal', NULL);
INSERT INTO public.clientes VALUES (5, 'Maria Martín', 'lucia.martin@mail.com', 'Boulevard D, 102', '644712345', 'España', NULL);
INSERT INTO public.clientes VALUES (6, 'Santi García', 'Santi.garcia@mail.com', 'Plaza E, 203', '655812345', 'Portugal', NULL);
INSERT INTO public.clientes VALUES (8, 'David Rodriguez', 'david.Rodriguez@mail.com', 'Avenida G, 405', '677012345', 'España', NULL);
INSERT INTO public.clientes VALUES (9, 'Ana Sánchez', 'Ana.sanchez@mail.com', 'Calle H, 506', '688112345', 'Italia', NULL);
INSERT INTO public.clientes VALUES (10, 'Angel Rodríguez', 'Angel.rodriguez@mail.com', 'Boulevard I, 607', '699212345', 'España', NULL);
INSERT INTO public.clientes VALUES (2, 'Lola López', 'maria.lopez@mail.com', 'Nueva Calle B, 123', '611412345', 'España', NULL);
INSERT INTO public.clientes VALUES (4, 'Pepa Gómez', 'Pepa.gomez@mail.com', 'Calle Z, 101', '600305050', 'Francia', NULL);
INSERT INTO public.clientes VALUES (7, 'Vega Jiménez', 'sofia.jimenez@mail.com', 'Calle F, 304', '600370770', 'Francia', NULL);


--
-- TOC entry 4835 (class 0 OID 16960)
-- Dependencies: 226
-- Data for Name: detalle_envios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.detalle_envios VALUES (2, 1, 'Producto 2', 3, 100.00);
INSERT INTO public.detalle_envios VALUES (3, 2, 'Producto 3', 4, 50.00);
INSERT INTO public.detalle_envios VALUES (4, 2, 'Producto 4', 1, 50.00);
INSERT INTO public.detalle_envios VALUES (5, 3, 'Producto 5', 5, 88.00);
INSERT INTO public.detalle_envios VALUES (6, 4, 'Producto 6', 2, 33.00);
INSERT INTO public.detalle_envios VALUES (7, 5, 'Producto 7', 3, 1300.00);
INSERT INTO public.detalle_envios VALUES (8, 6, 'Producto 8', 1, 234.00);
INSERT INTO public.detalle_envios VALUES (9, 7, 'Producto 9', 4, 34.00);
INSERT INTO public.detalle_envios VALUES (10, 8, 'Producto 10', 2, 125.00);
INSERT INTO public.detalle_envios VALUES (1, 1, 'Producto 1', 2, 110.00);


--
-- TOC entry 4827 (class 0 OID 16861)
-- Dependencies: 218
-- Data for Name: empleados; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.empleados VALUES (1, 'Alberto Ruiz', 'Supervisor', 'alberto.ruiz@mail.com', NULL);
INSERT INTO public.empleados VALUES (2, 'Cristina Díaz', 'Coordinadora', 'cristina.diaz@mail.com', NULL);
INSERT INTO public.empleados VALUES (3, 'Daniela Moreno', 'Gerente', 'daniela.moreno@mail.com', NULL);
INSERT INTO public.empleados VALUES (4, 'Felipe Álvarez', 'Asistente', 'felipe.alvarez@mail.com', NULL);
INSERT INTO public.empleados VALUES (5, 'Gabriela Romero', 'Director de Datos', 'gabriela.romero@mail.com', NULL);


--
-- TOC entry 4833 (class 0 OID 16925)
-- Dependencies: 224
-- Data for Name: envios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.envios VALUES (1, 1, 2, 1, '2024-04-01', 200.00);
INSERT INTO public.envios VALUES (2, 2, 3, 2, '2024-04-02', 100.00);
INSERT INTO public.envios VALUES (6, 6, 3, 3, '2024-04-06', 234.00);
INSERT INTO public.envios VALUES (8, 8, 1, 2, '2024-04-08', 125.00);
INSERT INTO public.envios VALUES (3, 3, 1, 3, '2024-04-03', 88.00);
INSERT INTO public.envios VALUES (4, 4, 4, 3, '2024-04-04', 33.00);
INSERT INTO public.envios VALUES (5, 5, 5, 2, '2024-04-05', 1350.00);
INSERT INTO public.envios VALUES (7, 7, 2, 1, '2024-08-10', 34.00);


--
-- TOC entry 4829 (class 0 OID 16868)
-- Dependencies: 220
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.proveedores VALUES (1, 'Transporte S.A.', '902123456', 'Calle, 10', NULL);
INSERT INTO public.proveedores VALUES (3, 'Logística S.L.', '902789012', 'calle, 30', NULL);
INSERT INTO public.proveedores VALUES (2, 'Exprés S.A.', '902654321', 'Avenida , 20', NULL);


--
-- TOC entry 4831 (class 0 OID 16917)
-- Dependencies: 222
-- Data for Name: regiones; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.regiones VALUES (11, 'Madrid');
INSERT INTO public.regiones VALUES (12, 'Extremadura');
INSERT INTO public.regiones VALUES (13, 'Galicia');
INSERT INTO public.regiones VALUES (14, 'Castilla');
INSERT INTO public.regiones VALUES (15, 'Asturias');


--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 215
-- Name: clientes_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 10, true);


--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 225
-- Name: detalle_envios_id_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.detalle_envios_id_detalle_seq', 10, true);


--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 217
-- Name: empleados_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.empleados_id_empleado_seq', 5, true);


--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 223
-- Name: envios_id_envio_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.envios_id_envio_seq', 8, true);


--
-- TOC entry 4853 (class 0 OID 0)
-- Dependencies: 219
-- Name: proveedores_id_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.proveedores_id_proveedor_seq', 3, true);


--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 221
-- Name: regiones_id_region_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.regiones_id_region_seq', 15, true);


--
-- TOC entry 4666 (class 2606 OID 16859)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 4676 (class 2606 OID 16965)
-- Name: detalle_envios detalle_envios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detalle_envios
    ADD CONSTRAINT detalle_envios_pkey PRIMARY KEY (id_detalle);


--
-- TOC entry 4668 (class 2606 OID 16866)
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 4674 (class 2606 OID 16930)
-- Name: envios envios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.envios
    ADD CONSTRAINT envios_pkey PRIMARY KEY (id_envio);


--
-- TOC entry 4670 (class 2606 OID 16873)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id_proveedor);


--
-- TOC entry 4672 (class 2606 OID 16922)
-- Name: regiones regiones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_pkey PRIMARY KEY (id_region);


--
-- TOC entry 4680 (class 2606 OID 16966)
-- Name: detalle_envios detalle_envios_id_envio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detalle_envios
    ADD CONSTRAINT detalle_envios_id_envio_fkey FOREIGN KEY (id_envio) REFERENCES public.envios(id_envio);


--
-- TOC entry 4677 (class 2606 OID 16931)
-- Name: envios envios_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.envios
    ADD CONSTRAINT envios_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);


--
-- TOC entry 4678 (class 2606 OID 16936)
-- Name: envios envios_id_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.envios
    ADD CONSTRAINT envios_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleados(id_empleado);


--
-- TOC entry 4679 (class 2606 OID 16941)
-- Name: envios envios_id_proveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.envios
    ADD CONSTRAINT envios_id_proveedor_fkey FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(id_proveedor);


-- Completed on 2024-10-22 19:31:14

--
-- PostgreSQL database dump complete
--

