package crudadmin.produtos.cadatuprodutos;

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
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@WebServlet(name = "/Upload", urlPatterns = "/Upload")
public class Upload extends HttpServlet {

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

                            String caminho = this.getServletContext().getRealPath("admin/imgupload");
                            File diretorio = new File(caminho);
                            if (!diretorio.exists()){
                                diretorio.mkdir();
                            }

                            String nome = item.getName();
                            String arq[] = nome.split("\\\\");

                            for (int i = 0; i < arq.length; i++) {
                                nome = arq[i];
                            }

                            File file = new File(diretorio, nome);
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
                        System.out.println("XXXXXXXXXXXXXXXXXXXX"+Nomeevalor);
                        dados.put(item.getFieldName(), item.getString());
                    }

                }
                cadastrar(dados);
            } catch (FileUploadException ex) {

                ex.printStackTrace();

            }

        }

    }

    private void cadastrar(Map<String, String> dados){
        int id_produto, id_categoria, id_subcategoria, id_fabricante;
        double preco_alto, preco;
        String produto, descricao, detalhes, ativo_produto, imagem, destaque;

        id_categoria = Integer.parseInt(dados.get("id-categoria"));
        id_subcategoria = Integer.parseInt(dados.get("id-subcategoria"));
        id_fabricante = Integer.parseInt(dados.get("id-fabricante"));
        preco_alto = Double.parseDouble(dados.get("precoalto"));
        preco = Double.parseDouble(dados.get("preco"));
        produto = dados.get("produto-nome");
        descricao = dados.get("descricao");
        detalhes = dados.get("detalhes");
        ativo_produto = dados.get("ativo-produto");
        //imagem = dados.get("imagem");
        //destaque = dados.get("destaque");

        //POINTER

        System.out.println("-X-----------"+id_categoria);
        System.out.println("--X----------"+id_subcategoria);
        System.out.println("---X---------"+id_fabricante);
        System.out.println("----X--------"+preco_alto);
        System.out.println("-----X-------"+preco);
        System.out.println("------X------"+produto);
        System.out.println("-------X-----"+descricao);
        System.out.println("--------X----"+detalhes);
        System.out.println("---------X---"+ativo_produto);
        //System.out.println("----------X--"+imagem);
        //System.out.println("-----------X-"+destaque);

    }


}
