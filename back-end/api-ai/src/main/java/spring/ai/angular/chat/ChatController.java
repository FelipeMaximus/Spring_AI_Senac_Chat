package spring.ai.angular.chat;

import javax.validation.constraints.NotNull;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController //cria ENDPOINTS RESTS que seria o CRUD
@RequestMapping("/api/chat") //CHAMA O ENDPOINT DO VSCODE
public class ChatController {
	
	//codigo pronto da API do SpringAI
	private final ChatClient chatClient;//INTERFACE GENERICA

    public ChatController(@NotNull ChatClient.Builder chatClientBuilder) {
        this.chatClient = chatClientBuilder.build();
        //o ChatClientBuilder irá chamar o método .build que vai retornar o chatClient
        // O CHATMODEL CRIA UMA INSTANCIA DA IMPLEMENTAÇÃO DA OPENAI
    }
    
  //METODO pronto da API do SpringAI
    @PostMapping //("/ai") ENDPOINT chamado ai
    ChatMessage simpleChat(@RequestBody ChatMessage message) {//REQUESTBODY le o conteudo do POST da requisição //*input onde irá colocar uma frase de pergunta
        var response = this.chatClient.prompt() //esta instancia chat vai chamar o PROMPT e irá retorna uma REQUEST
            .user(message.message())//*CHAMA A PERSONA
            .call() //INVOCA O SPRING-AI CONECTANDO ELA AO SERVIDOR DA OPENAI
            .content();//OBTEM O CONTEUDO DA RESPOSTA
        return new ChatMessage(response);
    }
    

}
