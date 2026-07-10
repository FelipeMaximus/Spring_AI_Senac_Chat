--
-- PostgreSQL database dump
--

\restrict mabqDeQqriXr52R1K8oV5tRJcXdsqphUewqrUv3hZl7qcIiS3uf70cSlybGmujS

-- Dumped from database version 16.14 (Debian 16.14-1.pgdg13+1)
-- Dumped by pg_dump version 16.14

-- Started on 2026-07-09 15:28:59

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16403)
-- Name: chat_memory; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.chat_memory (
    conversation_id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id character varying(50) NOT NULL,
    description character varying(35) NOT NULL
);


ALTER TABLE public.chat_memory OWNER TO myuser;

--
-- TOC entry 215 (class 1259 OID 16396)
-- Name: spring_ai_chat_memory; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.spring_ai_chat_memory (
    conversation_id character varying(36) NOT NULL,
    content text NOT NULL,
    type character varying(10) NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    CONSTRAINT spring_ai_chat_memory_type_check CHECK (((type)::text = ANY ((ARRAY['USER'::character varying, 'ASSISTANT'::character varying, 'SYSTEM'::character varying, 'TOOL'::character varying])::text[])))
);


ALTER TABLE public.spring_ai_chat_memory OWNER TO myuser;

--
-- TOC entry 3419 (class 0 OID 16403)
-- Dependencies: 216
-- Data for Name: chat_memory; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.chat_memory (conversation_id, user_id, description) FROM stdin;
4e1377fd-117e-43e4-a44f-95374a727d1e	filypy	Chat sobre Java - Programação
8d80c960-103b-46be-bce6-67950042de58	filypy	Chat sobre Java - Desenvolvimento e
825347f3-c311-419f-aab2-e72d7c7d9206	filypy	Chat sobre piadas de Java
42b6b872-457a-466c-933a-844853686499	filypy	Chat sobre piadas de Java
1f8d18a5-c71d-46de-b749-859ef209da79	filypy	Chat sobre piadas de Java
bcdda46b-2dcd-4af6-941f-0f09d594fb7f	filypy	Chat sobre piadas de Java
fecf4ce2-7130-4115-a098-b846cbf6aed1	filypy	Chat sobre piadas de Java
245f90dd-da80-433e-8af4-2b3d7f60b706	filypy	Chat sobre piadas de Java
fe2b909a-7069-48fa-ac9d-f73a151d5fcd	filypy	Chat sobre piadas de Java
3541299e-2835-4da8-b116-1ce2ec7e4958	filypy	Chat sobre piadas de Java
74869925-ce2f-4cba-9386-31e26009ee4e	filypy	Chat sobre piadas de Java
035be914-7898-4482-82a2-c87c55d71e2e	filypy	Chat sobre piadas de Java
c71e4a77-03d5-449e-a782-de460fbf5ca3	filypy	Chat sobre piadas de Java
704f6610-d37c-47a9-82cd-0a56a1f425e6	filypy	Chat sobre piadas de Java
0875c789-9768-418f-bd32-b3b37618d9f9	filypy	Chat sobre piadas de Java
54847444-7595-489d-aff5-992583adb83e	filypy	Chat sobre piadas de Java
e0d72df8-2ab7-4cc9-89f6-b88014655431	filypy	Chat sobre piadas de Java
6660f7cf-e4f5-451c-9bff-db25c332ad11	filypy	Chat sobre piadas de Java
a7efc8b3-95c4-4a77-a1db-85fcf70dec1d	filypy	Chat sobre piadas de Java
f42c5571-eb33-4bd1-bb6a-8dc97e06acc0	filypy	Chat sobre piadas de Java
09205b30-cd14-487f-a0b0-501351de77aa	filypy	Chat sobre piadas de Java
892899d2-7e7b-4467-a23b-ffdfd1b33584	filypy	Chat sobre piadas de Java
58788624-4b84-4ade-8ae3-b2a355dcc639	filypy	Chat com Gaby - conversa pessoal
0c5cd84a-9a39-4fb8-9026-1a6ff5b4c0b4	filypy	Chat perguntando sobre nomes própri
722e690a-3b9b-4453-b636-4c31b5a191ec	filypy	Chat com saudações e apresentações
6d5648ac-7857-4250-b295-aa52f9ed6264	filypy	Chat de apresentação pessoal
b52e7286-e60b-4739-842f-8fee52fd4c61	filypy	Chat de perguntas sobre identidade
b614528f-3e47-4326-8717-7402737adb28	filypy	Chat de apresentação pessoal
db2514c9-0104-4dbd-82ed-c160b51d398c	filypy	Chat de perguntas sobre identidade 
ae45f522-8ee8-4eea-9e68-92aa6c661965	filypy	Chat de saudações e apresentações
f6690f0a-c116-4c97-9835-946804b15c8d	filypy	Chat de apresentação pessoal
facf705f-449b-49b4-a06a-10466a414d15	filypy	Chat de perguntas sobre identidade 
f3def573-df2e-4b3e-b2df-502d8fefb0d2	filypy	Chat de conversas informais e sauda
c33c8e6a-1355-47df-8b84-1645350f69de	filypy	Chat de apresentação pessoal do Fel
6cac0146-a2cd-428e-b502-022dc371235a	filypy	Chat de perguntas sobre identidade 
5a6f8f79-0547-4459-b3bc-10e6599f8d30	filypy	Chat de humor com piadas sobre prog
6466ae86-cdf0-4290-8c96-c8e80e43addf	filypy	Chat de saudações e interações soci
1c64f6ee-6220-479b-ad1b-530c36956b40	filypy	Chat de boas-vindas e assistência a
5fe5ee1f-7fbe-40b6-b97a-559f9111cfd0	filypy	Chat de atendimento e suporte ao cl
c9b256e3-aff3-4827-adae-e03ca2f52e39	filypy	Chat sobre linguagem de programação
13f02e52-9bde-4113-8f8f-06a62616926c	filypy	Chat de boas-vindas e introdução ao
368862fd-1816-4b3d-a029-0ce4c7916f03	filypy	Chat sobre origens e identidade pes
9d918f96-3558-4b8e-9f47-cb9941213ae5	filypy	Chat de apresentação e saudação ini
7f25ed46-5724-403d-b60e-4912665f7715	filypy	Chat sobre localização geográfica a
2a0c73e7-f071-4efe-9f01-bf49ffceeaa9	filypy	Chat sobre localização geográfica d
1ed1108f-6a91-4227-a2ff-e455f66ac0ac	filypy	Chat sobre funcionamento da memória
2e99b89a-a908-4a67-897b-a9dcb7dc54f3	filypy	Chat com piada sobre programação Ja
508efe45-3fdb-4efd-a81e-71a30163e811	filypy	Piada sobre Java
e799b7bc-75d2-430b-9ef8-9861e0fac88f	filypy	Piada sobre Java
ef7c3fb8-9294-4657-a89f-641302f5b231	filypy	Olá, como posso ajudar?
6aeac4ff-6b50-4285-898d-596b290d63ec	filypy	Conversa casual
cc64c74e-502a-4ee0-9e1d-2dc3d1e0ea09	filypy	Conversa positiva
48f0f20a-4ecd-4cef-97c8-43ae3bf21cdf	filypy	Piadas engraçadas
c3ab53a9-a6ce-442d-8a6d-49fed81b16da	filypy	Conheça Ana
d49e1925-02f6-48b9-b74c-5a7e9813c7ac	filypy	Ana
\.


--
-- TOC entry 3418 (class 0 OID 16396)
-- Dependencies: 215
-- Data for Name: spring_ai_chat_memory; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.spring_ai_chat_memory (conversation_id, content, type, "timestamp") FROM stdin;
722e690a-3b9b-4453-b636-4c31b5a191ec	ola	USER	2026-07-08 16:48:58
722e690a-3b9b-4453-b636-4c31b5a191ec	Olá! Como posso ajudar você hoje?	ASSISTANT	2026-07-08 16:48:59
ae45f522-8ee8-4eea-9e68-92aa6c661965	ola chat	USER	2026-07-08 16:53:42
ae45f522-8ee8-4eea-9e68-92aa6c661965	Olá! Como posso ajudar você hoje?	ASSISTANT	2026-07-08 16:53:43
6d5648ac-7857-4250-b295-aa52f9ed6264	meu nome é jhamis	USER	2026-07-08 16:49:34
6d5648ac-7857-4250-b295-aa52f9ed6264	Olá, Jhamis! Prazer em te conhecer. Como posso te ajudar hoje?	ASSISTANT	2026-07-08 16:49:35
f6690f0a-c116-4c97-9835-946804b15c8d	meu nome é deise	USER	2026-07-08 16:53:53
f6690f0a-c116-4c97-9835-946804b15c8d	Olá, Deise! Prazer em conhecê-la. Como posso ajudar você hoje?	ASSISTANT	2026-07-08 16:53:54
123456	Gere uma descrição de chat baseado na mensagem, limitando a descrição a 30 caracteresola	USER	2026-07-08 15:19:50
123456	Chat sobre piadas de Java	ASSISTANT	2026-07-08 15:19:51
123456	Gere uma descrição de chat baseado na mensagem, limitando a descrição a 30 caracteresola	USER	2026-07-08 15:19:52
123456	Chat sobre piadas de Java	ASSISTANT	2026-07-08 15:19:53
123456	Gere uma descrição de chat baseado na mensagem, limitando a descrição a 30 caracteresola	USER	2026-07-08 15:19:54
123456	Chat sobre piadas de Java	ASSISTANT	2026-07-08 15:19:55
123456	Gere uma descrição de chat baseado na mensagem, limitando a descrição a 30 caracteresmeu nome e gaby	USER	2026-07-08 15:19:56
123456	Chat com Gaby - conversa pessoal	ASSISTANT	2026-07-08 15:19:57
123456	Gere uma descrição de chat baseado na mensagem, limitando a descrição a 30 caracteresqual o meu nome?	USER	2026-07-08 15:19:58
123456	Chat perguntando sobre nomes próprios	ASSISTANT	2026-07-08 15:19:59
default	me conte outra	USER	2026-07-09 15:19:47
default	Por que o gato entrou no computador? Para pegar o mouse!	ASSISTANT	2026-07-09 15:19:48
default	Gere uma descrição de chat baseado na mensagem, limitando a descrição a 30 caracteresmeu nome é ana	USER	2026-07-09 15:19:49
default	Conheça Ana	ASSISTANT	2026-07-09 15:19:50
default	meu nome é ana	USER	2026-07-09 15:19:51
default	Olá Ana! É um prazer conhecer você! Como posso ajudar você hoje?	ASSISTANT	2026-07-09 15:19:52
default	Gere uma descrição de chat baseado na mensagem, limitando a descrição a 30 caracteresqual o o meu nome?	USER	2026-07-09 15:19:53
default	Ana	ASSISTANT	2026-07-09 15:19:54
default	qual o o meu nome?	USER	2026-07-09 15:19:55
default	Você disse que seu nome é Ana!	ASSISTANT	2026-07-09 15:19:56
b52e7286-e60b-4739-842f-8fee52fd4c61	qual é o meu nome?	USER	2026-07-08 16:52:24
b52e7286-e60b-4739-842f-8fee52fd4c61	Eu não sei o seu nome, pois você não me informou. Como posso te chamar?	ASSISTANT	2026-07-08 16:52:25
facf705f-449b-49b4-a06a-10466a414d15	qual é o meu nome?	USER	2026-07-08 16:54:03
facf705f-449b-49b4-a06a-10466a414d15	Eu não tenho acesso às suas informações pessoais, então não sei qual é o seu nome. Como posso te chamar?	ASSISTANT	2026-07-08 16:54:04
b614528f-3e47-4326-8717-7402737adb28	meu nome é jose	USER	2026-07-08 16:52:42
b614528f-3e47-4326-8717-7402737adb28	Olá, José! Prazer em te conhecer. Como posso te ajudar hoje?	ASSISTANT	2026-07-08 16:52:43
db2514c9-0104-4dbd-82ed-c160b51d398c	qual o meu nome?	USER	2026-07-08 16:52:52
db2514c9-0104-4dbd-82ed-c160b51d398c	Eu não tenho como saber o seu nome, pois você não me informou. Você poderia me dizer como se chama? Ficarei feliz em conhecê-lo!	ASSISTANT	2026-07-08 16:52:53
\.


--
-- TOC entry 3274 (class 2606 OID 16408)
-- Name: chat_memory chat_memory_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.chat_memory
    ADD CONSTRAINT chat_memory_pkey PRIMARY KEY (conversation_id);


--
-- TOC entry 3272 (class 1259 OID 16402)
-- Name: spring_ai_chat_memory_conversation_id_timestamp_idx; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX spring_ai_chat_memory_conversation_id_timestamp_idx ON public.spring_ai_chat_memory USING btree (conversation_id, "timestamp");


-- Completed on 2026-07-09 15:28:59

--
-- PostgreSQL database dump complete
--

\unrestrict mabqDeQqriXr52R1K8oV5tRJcXdsqphUewqrUv3hZl7qcIiS3uf70cSlybGmujS

