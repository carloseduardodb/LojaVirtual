<%@ page import="crudclient.cliente.ClienteDAO" %>
<%@ page import="crudclient.cliente.Cliente" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 18/05/2020
  Time: 07:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String nome = "", email = "", cpf = "", endereco = "", numero = "", complemento = "",
            bairro = "", cidade = "", uf = "", cep = "", telefone = "", senha = "", acao = "";

    acao = ""+request.getParameter("acao");
    nome = ""+request.getParameter("nome") + request.getParameter("sobrenome");
    email = ""+request.getParameter("email");
    cpf = ""+request.getParameter("cpf");
    endereco = ""+request.getParameter("endereco");
    numero = ""+request.getParameter("numero");
    complemento = ""+request.getParameter("complemento");
    bairro = ""+request.getParameter("bairro");
    cidade = ""+request.getParameter("cidade");
    uf = ""+request.getParameter("uf");
    cep = ""+request.getParameter("cep");
    telefone = ""+request.getParameter("telefone");
    senha = ""+request.getParameter("senha");

    MessageDigest algorithm = MessageDigest.getInstance("SHA-256");
    byte messageDigest[] = algorithm.digest(senha.getBytes("UTF-8"));

    StringBuilder hexString = new StringBuilder();
    for (byte b : messageDigest) {
        hexString.append(String.format("%02X", 0xFF & b));
    }

    senha = hexString.toString();

    if (acao.equals("cadastrar")) {
        Cliente cl = new Cliente(null, null, null, null, null, nome, cpf, null, endereco,
                numero, complemento, bairro, cidade, uf, cep, null, telefone, null, null, email, senha, null, "S");
        ClienteDAO clienteDAO = new ClienteDAO();
        clienteDAO.create(cl);

        response.sendRedirect("../../index.jsp");

    }else if(acao.equals("login")){
        ClienteDAO clienteDAO = new ClienteDAO();
        List<Cliente> cliente = clienteDAO.read("SELECT * FROM cliente WHERE email = '"+email+"' AND senha = '" + senha +"'");
        if(cliente.isEmpty()){
            response.sendRedirect("../../index.jsp?pagina=login&login=false");
        }else{
            session.setAttribute("cliente", cliente);
            response.sendRedirect("../../index.jsp?login=true");
        }
    }
%>
