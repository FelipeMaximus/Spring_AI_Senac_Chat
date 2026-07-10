import { Routes } from '@angular/router';

export const routes: Routes =[
  { path: '', redirectTo: 'simple-chat', pathMatch: 'full' },
  { path: 'simple-chat',
    loadComponent: () => import('./chat/simple-chat/simple-chat').then(c => c.SimpleChat)
  },
  { path: '**', redirectTo: 'simple-chat' }
];

/*
ROTAS DA APLICAÇÃO

1. path: ''
   - Representa a URL raiz (http://localhost:4200/)
   - Redireciona automaticamente para '/simple-chat'

2. path: 'simple-chat'
   - Carrega o componente SimpleChat
   - Utiliza Lazy Loading através do loadComponent()
   - O componente é carregado somente quando a rota é acessada

3. path: '**'
   - Rota coringa (Wildcard)
   - Captura qualquer URL inexistente
   - Redireciona para '/simple-chat'

Fluxo:
'/' → '/simple-chat' → SimpleChat
'/simple-chat' → SimpleChat
Qualquer outra URL → '/simple-chat' → SimpleChat
*/

