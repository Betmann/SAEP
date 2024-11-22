import React, { useState } from "react";
import axios from "axios";
import { Link } from "react-router-dom";
import { ReactComponent as Logo } from "../../assets/Logo.svg";
import "./styles.css";

function Home() {
  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [msn, setMsn] = useState("");

  const handleSubmit = async (event) => {
    event.preventDefault();
    try {
      const response = await axios.post("http://127.0.0.1:8000/api/users/", {
        username,
        email,
      });
      console.log("Usuário cadastrado:", response.data);
      setMsn("Cadastro concluído com sucesso!!!");
      setUsername("");
      setEmail("");
    } catch (error) {
      console.log("Username: ", username);
      console.log("Email: ", email);
      console.error("Erro ao cadastrar usuário:", error);
      setMsn("Erro ao cadastrar usuário.");
    }
  };

  return (
    <div className="containner">
      <header className="header">
        <div className="logo-container">
          <Logo className="logo" />
        </div>
        <nav className="nav">
          <Link className="Link" to="#cadastro-usuarios">
            Cadastro de Usuários
          </Link>
          <Link className="Link" to="/cadastrar-tarefas">
            Cadastro de Tarefas
          </Link>
          <Link className="Link" to="/gerenciar-tarefas">
            Gerenciar Tarefas
          </Link>
        </nav>
      </header>

      <main className="containerCadastro">
        <form onSubmit={handleSubmit} className="formularioCadastro">
          <h1>Cadastro de Usuários</h1>
          <div className="inputContainerCasdatro">
            <label htmlFor="username">Nome:</label>
            <input
              type="text"
              id="username"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              required
            />
          </div>

          <div className="inputContainerCasdatro">
            <label htmlFor="email">Email:</label>
            <input
              type="email"
              id="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
          </div>

          <div className="buttonContainer">
            <button type="submit" className="submitButton">
              Cadastrar
            </button>
          </div>

          <div style={{ display: "flex", justifyContent: "center" }}>
            <p style={{ color: "black" }}>{msn}</p>
          </div>
        </form>
      </main>
    </div>
  );
}

export default Home;
