import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

export interface ChatResponse {
  chatId: string;
  description: string;
  response: string;
}

@Injectable({
  providedIn: 'root',
})
export class ChatService {

  //PARA O PRIMEIRO TEST DE POT DO POSTAMAN
  //private readonly API = '/api/chat'; //API, e entre aspas esta o  nosso ENDPOINT

  //AQUI PARA OS ALUNOS VAI DESCOMENTAR O PRIMEIRO
  //private readonly API = '/api/chat-memory/start'; //API, e entre aspas esta o  nosso ENDPOINT
  private readonly API = environment.apiUrl + '/api/chat-memory/start';//CONEXÃO HOSPEDAGEM RENDER

  private http = inject(HttpClient); //INJETANDO O HTTPCLIENT PARA FAZER A REQUISIÇÃO HTTP

  //metodo para enviar a mensagem do usuário para o back-end e receber a resposta do bot
  sendChatMessage(message: string): Observable<ChatResponse> { //ALTERAÇÃO DE IA
    console.log('Service enviando:', message); //ALTERAÇÃO DE IA
    //retorna um observable do tipo ChatResponse, que é a resposta do bot
    return this.http.post<ChatResponse>(this.API, { content: message, type: 'USER' }); //TIPANDO A CHAMADA E PROCESSANDO A INFORMAÇÃO COM O POST
    //observação: acima antes usavamos o message para a requisição
  }
}
