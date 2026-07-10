package spring.ai.angular.memory;


import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


//REPOSITORIO DA TABELA CHAT-MEMORY - PONTE COM O BANCO DE DADOS
@Repository
public class MemoryChatRepository {
	
	private final JdbcTemplate jdbcTemplate;
	
	//INJEÇÃO DO CONSTRUTOR
	public MemoryChatRepository(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate =jdbcTemplate;
	}
	
	//INSERINDO O ID E A DESCRIÇÃO E RETORNA O CONVERSATION
	public String generateChatId(String userId, String description) {
		final String sql = "INSERT INTO chat_memory (user_id, description) VALUES (?, ?) RETURNING conversation_id";
		return jdbcTemplate.queryForObject(sql, String.class, userId, description);
	}

	//LISTA TODOS OS CHATS
	public List<Chat> getAllChatsForUser(String userId) {
		final String sql = "SELECT conversation_id, user_id, description FROM chat_memory WHERE user_id = ?";
		return jdbcTemplate.query(sql, (rs, _) ->
	    new Chat(rs.getString("conversation_id"), rs.getString("description"))
	    ,userId);
	}
	
	
	public List<ChatMessage> getChatMessages(String chatId){
		//ESTA QUERY - PASSA OS DADOS NA TABELA
		final String sql = "SELECT content, type from SPRING_AI_CHAT_MEMORY WHERE conversation_id = ? ORDER BY timestamp ASC";
		return jdbcTemplate.query(sql, (rs, _)->
		//OBTEM O CONTEUDO E O TIPO
				new ChatMessage(rs.getString("content"), rs.getString("type")), chatId);
	}
}
