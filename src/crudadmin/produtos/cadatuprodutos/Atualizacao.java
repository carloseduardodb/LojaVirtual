package crudadmin.produtos.cadatuprodutos;

import crudadmin.produtos.Produto;
import crudadmin.produtos.ProdutosDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@WebServlet(name = "/Atualizacao", urlPatterns = "/Atualizacao")
public class Atualizacao extends HttpServlet {

    Timestamp dataDeHoje = new Timestamp(System.currentTimeMillis());
    private String diretoriobd = "";
    private String nomearquivo = ""+dataDeHoje;

    public void init() throws ServletException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        boolean isMultiPart = FileUpload.isMultipartContent(request);
        Map<String, String> dados = new HashMap<String, String>();

        if (isMultiPart) {

            FileItemFactory factory = new DiskFileItemFactory();

            ServletFileUpload upload = new ServletFileUpload(factory);

            String formulario = "";

            try {

                List items = upload.parseRequest(request);

                Iterator iter = items.iterator();

                while (iter.hasNext()) {

                    FileItem item = (FileItem) iter.next();

                    if (item.getFieldName().equals("tipoForm")) {

                        formulario = item.getString();

                    }

                    if (!item.isFormField()) {

                        if (item.getName().length() > 0) {

                            String caminho = this.getServletContext().getRealPath("admin/imgupload") ;
                            File diretorio = new File(caminho);
                            if (!diretorio.exists()){
                                diretorio.mkdir();
                            }
                            diretoriobd = caminho;
                            String nome = item.getName();
                            String arq[] = nome.split("\\\\");

                            for (int i = 0; i < arq.length; i++) {
                                nome = arq[i];
                            }

                            String extensao = nome.substring(nome.length()-4);
                            nomearquivo = nomearquivo.replace("-", "").
                                    replace(" ","").replace(":","").
                                    replace(".","");

                            nomearquivo = nomearquivo+extensao;

                            File file = new File(diretorio, nomearquivo);
                            FileOutputStream output = new FileOutputStream(file);
                            InputStream is = item.getInputStream();
                            byte[] buffer = new byte[2048];
                            int nLidos;
                            while ((nLidos = is.read(buffer)) >= 0) {
                                output.write(buffer, 0, nLidos);
                            }
                            output.flush();
                            output.close();
                        }

                    }else{
                        String Nomeevalor = "Nome: "+item.getFieldName() + "  Valor:"+item.getString();
                        dados.put(item.getFieldName(), item.getString());
                    }

                }
                atualizar(dados);
            } catch (FileUploadException ex) {

                ex.printStackTrace();

            }

        }
    }

    private void atualizar(Map<String, String> dados){
        int id_produto, id_categoria, id_subcategoria, id_fabricante;
        float preco_alto, preco;
        String produto, descricao, detalhes, ativo_produto, imagem, destaque;

        id_produto = Integer.parseInt(dados.get("id-produto"));
        id_categoria = Integer.parseInt(dados.get("id-categoria"));
        id_subcategoria = Integer.parseInt(dados.get("id-subcategoria"));
        id_fabricante = Integer.parseInt(dados.get("id-fabricante"));
        preco_alto = Float.parseFloat(dados.get("precoalto"));
        preco = Float.parseFloat(dados.get("preco"));
        produto = dados.get("produto-nome");
        descricao = dados.get("descricao");
        detalhes = dados.get("detalhes");
        ativo_produto = dados.get("ativo-produto");
        imagem = nomearquivo;
        destaque = dados.get("destaque");

        //System.out.println("-----------X-"+destaque);

        ProdutosDAO pddao = new ProdutosDAO();
        Produto pd = new Produto(id_produto, id_categoria, id_subcategoria,
                id_fabricante, produto, preco_alto, preco, descricao,
                detalhes, ativo_produto, imagem, destaque);
        pddao.update(pd);
    }

}
