package spring.ai.angular.memory;

import java.util.List;

import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.client.advisor.MessageChatMemoryAdvisor;
import org.springframework.ai.chat.client.advisor.SimpleLoggerAdvisor;
import org.springframework.ai.chat.memory.ChatMemory;
import org.springframework.ai.chat.memory.MessageWindowChatMemory;
import org.springframework.ai.chat.memory.repository.jdbc.JdbcChatMemoryRepository;
import org.springframework.stereotype.Service;


//AQUI FICA OS SERVIÇOS

@Service
public class MemoryChatService {

	private final ChatClient chatClient;
	
	private final MemoryChatRepository memoryChatRepository;
	
	private static final String USER_ID = "filypy";//PADRÃO DE USUÁRIO
	private static final String DESCRIPTION_PROMPT = "Gere uma descrição de chat baseado na mensagem, limitando a descrição a 30 caracteres";
	
	public MemoryChatService(ChatClient.Builder chatClientBuilder, JdbcChatMemoryRepository jdbcChatMemoryRepository, 
			MemoryChatRepository memoryChatRepository) {//injeção do serviço pelo controller
		//o jdbc aqui é preciso para persistir os ddos no postgres
		this.memoryChatRepository = memoryChatRepository;
		
		
		
		//OTIMIZANDO A MEMORIA DO CHAT
		ChatMemory chatMemory = MessageWindowChatMemory.builder()
				.chatMemoryRepository(jdbcChatMemoryRepository)//segredo para mostrar a conversa no postgres
				.maxMessages(10)//limita até 10 mensagens
				.build();
		
		//COM O CHATMEMORY COLOCAMOS MEMÓRIA NO NOSSO CHATGPT ele guarda tudo em um HASHMAP
		this.chatClient = chatClientBuilder
				.defaultAdvisors(MessageChatMemoryAdvisor.builder(chatMemory).build(),
						new SimpleLoggerAdvisor()//vendo os logs
					)
				.build();
		
	}
	
	//O BANCO DE DADOS SALVARÁ NO MÁXIMO 20 MENSAGENS
	
	public String chat(String message,String chatId) {
		return this.chatClient.prompt()//retorna a mensagem
				//.advisors(a -> a.param(ChatMemory.CONVERSATION_ID, "123456"))//pode criar um usuário diferente
				.advisors(a -> a.param("chat_memory_conversation_id", "default"))//O SEGREDO DA MEMORIA DO CHAT ESTA AQUI
				.user(message)
				.call()
				.content();
		}
	
	//CHAT_ID/DESCRIÇÃO E RESPOSTA
	//AQUI GERA A DESCRIÇÃO O CHAT_ID E A RESPOSTA
	public NewChatResponse createNewChat(String message) {
		String description = generateDescription(message);
		String chatId = this.memoryChatRepository.generateChatId(USER_ID, description);
		String response = this.chat(message, chatId);
		return new NewChatResponse(chatId, description, response);
	}
	
	
	//DESCRIÇÃO DA CONVERSA NA ABA LATERAL
	private String generateDescription(String message) {
		String description = this.chatClient.prompt()//retorna a mensagem
				.advisors(a -> a.param(ChatMemory.CONVERSATION_ID, "default"))//pode criar um usuário diferente
				.user(DESCRIPTION_PROMPT + message)
				.call()
				.content();
		
		 if (description.length() > 35) {
		     description = description.substring(0, 35);
		 }
		 return description;
	}
	
	//LISTA TODAS AS MENSAGENS DE CHAT DO USUARIO
	public List<Chat> getAllChatsForUser(){
		return this.memoryChatRepository.getAllChatsForUser(USER_ID);
	}
	
	//METODO OBTEM...
	public List<ChatMessage> getChatMessages(String chatId){
		return this.memoryChatRepository.getChatMessages(chatId);
	}
}