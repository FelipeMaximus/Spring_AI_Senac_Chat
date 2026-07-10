import { Component, signal, ViewChild, ElementRef, inject } from '@angular/core';
import { NgClass } from '@angular/common';
import { MatCardModule } from '@angular/material/card';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { FormsModule } from '@angular/forms';
import { ChatService, ChatResponse } from '../chat-service';
import { catchError } from 'rxjs/operators';
import { throwError } from 'rxjs';

//BACK-END PRINCIPAL DA APLICAÇÃO FRONT

@Component({
  selector: 'app-simple-chat',
  imports: [MatCardModule, MatToolbarModule, MatInputModule, MatButtonModule, MatIconModule, FormsModule, NgClass],
  templateUrl: './simple-chat.html',
  styleUrl: './simple-chat.scss',
})


export class SimpleChat {

  @ViewChild('chatHistory')
  private chatHistory!: ElementRef;//referencia para o elemento e manipulação do html (!) exclamação para nao dar erro de null

  private chatService = inject(ChatService);

  //variavel para capturar o prompt
  userInput = '';

//FUNÇÃO PARA NÃO DEIXAR O CLIENTE ESCREVER ATE O CHAT RESPONDER TUDO
  isLoading = false;

  local = false;

  //trabalhando com array
  messages = signal([
    { text: 'Olá, como eu posso te ajudar hoje?', isBot: true}
  ]);


  sendMessage(){
    this.trimUserMessage();
    //se userinput for diferente de vazio envia o prompt
    if(this.userInput !== '' && !this.isLoading){//nao deixa dar enter duas vezes, se estiver carregando nao deixa enviar outra mensagem
      const messageToSend = this.userInput; // ALTERAÇÃO DE IA
      this.updateMessages(messageToSend); //ALTERAÇÃO DE IA
      //this.updateMessages(this.userInput);
      this.isLoading = true;

      if (this.local){
        this.simulateResponse(); //simula uma resposta do bot após o envio da mensagem do usuário
      }else{
        this.sendChatMessage(this.userInput); // ALTERAÇÃO DE IA
      }

    }
  }

  private sendChatMessage(message: string){
    this.userInput = ''; // ALTERAÇÃO DE IA

    this.chatService.sendChatMessage(message)//chama o chatservice e manda a mensagem que vai ser um input
    //TRATAMENTO DE ERRO CASO  API ESTEJA FORA DO AR
    .pipe(
      catchError((error) =>{
        console.error('Erro detectado no Angular:', error); //ALTERAÇÃO DE IA
        this.updateMessages('Desculpe, não posso procesar o seu REQUEST neste momento.', true);
        this.isLoading = false;//tira a animação
        return throwError(() => new Error('Erro ocorreu ao enviar a mensagem.'));
      })
    )
    //subscribe pega uma respotas e atualiza as menssagens
    .subscribe( response =>{
      console.log('Resposta completa:', response);
      this.updateMessages(response.response, true);
      //this.userInput = ''; //ALTERAÇÃO DE IA
      this.isLoading = false;
    });
  }

  //FUNÇÃO PARA ATUALIZAR AS MENSAGENS
  private updateMessages(text : string, isBot = false) {
    this.messages.update(messages => [...messages, { text: text, isBot: isBot}]);
    this.scrollToBottom();//chama a função scrollToBottom para rolar a tela para o final do chat
  }

  //trim serve para remover espaços em branco do início e do fim da string, garantindo que a mensagem do usuário seja processada corretamente mesmo que haja espaços extras.
  private trimUserMessage(){
    this.userInput = this.userInput.trim();
  }

  //FUNÇÃO PARA SIMULAR UMA RESPOSTA
  private simulateResponse(){
    setTimeout(() => {
      const response = 'Esta é uma resposta simulada do Chat AI.';
      this.updateMessages(response, true);
      this.userInput = '';
       this.isLoading = false;
    }, 2000);
  }

  private scrollToBottom(){ //metodo serve para fazer o scrool ate o final da tela
    try {//tratando erro para a pagina nao parar de funcionar
      this.chatHistory.nativeElement.scrollTop = this.chatHistory.nativeElement.scrollHeight;//assimilando altura e top do scroll para fazer o scroll ate o final
    } catch(error) {}
  }
}
