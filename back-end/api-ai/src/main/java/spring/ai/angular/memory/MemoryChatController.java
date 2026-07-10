package spring.ai.angular.memory;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
@RequestMapping("/api/chat-memory") //ENDPOINT
public class MemoryChatController {
	
	
	private final MemoryChatService chatService; //injetando o serviço
	
	public MemoryChatController(MemoryChatService chatService) {//injeção por construtor
		this.chatService = chatService;
	}
	
	
	//ABAIXO ESTARAO OS 4 ENDPOINTS DE REQUISIÇÃO
	@PostMapping("/{chatId}")//ENVIA MSG A UMA CONVERSA EXISTENTE
	public ChatMessage simpleChat(@PathVariable String chatId, @RequestBody ChatMessage chatMessage) {
		var response = this.chatService.chat(chatMessage.content(), chatId);
		return new ChatMessage(response, "ASSISTANT");
	}
	
	@PostMapping("/start")//CRIA UMA NOVA CONVERSA
	NewChatResponse startNewChat(@RequestBody ChatMessage chatMessage) {
		return this.chatService.createNewChat(chatMessage.content());
	}
	
	@GetMapping
	List<Chat> getAllChatsForUser(){//LISTA AS CONVERSAS
		return this.chatService.getAllChatsForUser();
	}
	
	@GetMapping("/{chatId}")//BUSCA A MSG DA CONVERSA
	List<ChatMessage> getChatMessages(@PathVariable String chatId){
		return this.chatService.getChatMessages(chatId);
	}
}
