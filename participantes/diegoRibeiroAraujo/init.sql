CREATE TABLE clientes (
    id BIGINT NOT NULL,
    limite BIGINT NOT NULL,
    saldo BIGINT NOT NULL,
    version INTEGER NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE transacoes (
    tipo CHAR(1) NOT NULL CHECK (tipo IN ('c','d')),
    cliente_id BIGINT NOT NULL,
    id BIGINT PRIMARY KEY,
    realizada_em TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    valor BIGINT NOT NULL,
    descricao VARCHAR(10) NOT NULL
);

CREATE SEQUENCE transacoes_seq
    START WITH 1
    INCREMENT BY 50;

ALTER TABLE transacoes
    ADD CONSTRAINT FK_transacoes_clientes
    FOREIGN KEY (cliente_id)
    REFERENCES clientes(id);

INSERT INTO clientes (id, limite, saldo, version) VALUES
(1, 100000, 0, 0),
(2, 80000, 0, 0),
(3, 1000000, 0, 0),
(4, 10000000, 0, 0),
(5, 500000, 0, 0)
ON CONFLICT (id) DO NOTHING;
