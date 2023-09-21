<details>
  <summary><h1>View the README in English - 🇺🇸</h1></summary>

  # Daily Time Tracker App
  
  ## Welcome to the Daily Time Tracker App Repository!
  
  The Daily Time Tracker App is a simple and practical tool designed to help users manage their daily work schedule. This app is designed to calculate an estimated departure time based on user-configured working hours and display the total time worked on the current day.
  
  ## App Screenshots
  
  | App Video | Launch Screen | Home Screen (Light) |
  | :---: | :---: | :---: |
  | <img src="./imgs/video.gif" height="400"> | <img src="./imgs/lauchScreen.png" height="400"> | <img src="./imgs/home_light.png" height="400"> |
  |  |  |  |
  | Alert Message (Light) | Hours Worked Calculation (Light) | Settings Screen (Light) |
  | <img src="./imgs/home_alert.png" height="400"> | <img src="./imgs/home_calculate.png" height="400"> | <img src="./imgs/configuracoes_light.png" height="400"> |
  |  |  |  |
  | Alert Message (Dark) | Hours Worked Calculation (Dark) | Settings Screen (Dark) |
  | <img src="./imgs/home_alert_dark.png" height="400"> | <img src="./imgs/home_calculate_dark.png" height="400"> | <img src="./imgs/configuracoes_dark.png" height="400"> |
  
  ## Features
  
  - Departure Prediction: Based on defined working hours, the app calculates an estimate of the user's departure time.
  - Time Tracking: Monitor the total hours worked on the current day.
  - Custom Configuration: Set your daily working hours in the app settings.
  - Language Selection: Based on your mobile device's language settings, the app automatically selects the language (currently only English and Portuguese).
  - Custom Theme: Choose whether the app uses light mode or dark mode.
  
  ## Technologies Used
  
  The app was developed using the Swift programming language, using 100% native code. This means you don't need to install any dependencies to run the app.
  
  ## How to Use
  
  1. Install the app on your mobile device.
  2. Configure your daily working hours in the app settings.
  3. The app will automatically calculate the estimated departure time and the time worked on the current day.
  
  ## Key Learnings and Challenges
  
  ### Programatically
  
  - Implementation of `Localization` in the app to switch between English and Portuguese based on the device's language settings.
  - Implementation of a user-configurable Theme (light/dark mode).
  - Use of `UserDefaults` to persist data related to the selected theme (light/dark mode) and user settings.
  - Utilization of `observers` to manage theme switching.
  - Creation of a `Toast` component to send user notifications, including configuration options for `success`, `failed`, `alert`, and `neutral` notifications.
  - Implementation of transition animations within the `Toast` component.
  
  ### In Storyboard
  
  - Use of a set of adaptable colors based on the selected theme (light/dark mode).
  - Utilization of `stack view` to simplify the management of `constraints`.
  - Usage of `User Defined Runtime Attributes` to manage localization (language switching) within the storyboard.
  - Use of `@IBInspectable` to facilitate language changes in storyboard elements.
  
  ## Contributions
  
  Contributions to the Daily Time Tracker App are welcome! Feel free to open issues, submit pull requests, or suggest new features.
  
  ## License
  
  This project is licensed under the [MIT License](LICENSE).
  
  Download the Daily Time Tracker App now and keep track of your daily work hours!
</details>

<br><br>

<details open>
  <summary><h1>Visualize o README em Português - 🇧🇷</h1></summary>

  # Aplicativo Ponto Diário
  
  ## Bem-Vindo ao Repositório do Aplicativo Ponto Diário!
  
  O Aplicativo Ponto Diário é uma ferramenta simples e prática para auxiliar os usuários a gerenciar sua jornada diária de trabalho. Este aplicativo foi projetado para calcular uma previsão do horário de saída com base nas horas de trabalho configuradas pelo usuário e exibir o tempo total trabalhado no dia atual.
  
  ## Imagens do Aplicativo
  
  | Vídeo do App | Tela de Carregamento | Tela Inicial (light) |
  | :---: | :---: | :---: |
  | <img src="./imgs/video.gif" height="400"> | <img src="./imgs/lauchScreen.png" height="400"> | <img src="./imgs/home_light.png" height="400"> |
  |  |  |  |
  | Mensagem de Alerta (light) | Cálculo de Horas Trabalhadas (light) | Tela de Configurações (light) |
  | <img src="./imgs/home_alert.png" height="400"> | <img src="./imgs/home_calculate.png" height="400"> | <img src="./imgs/configuracoes_light.png" height="400"> |
  |  |  |  |
  | Mensagem de Alerta (dark) | Cálculo de Horas Trabalhadas (dark) | Tela de Configurações (dark) |
  | <img src="./imgs/home_alert_dark.png" height="400"> | <img src="./imgs/home_calculate_dark.png" height="400"> | <img src="./imgs/configuracoes_dark.png" height="400"> |
  
  ## Recursos
  
  - *Previsão de Saída*: Com base nas horas de trabalho definidas, o aplicativo calcula uma estimativa do horário de saída do usuário.
  - *Acompanhamento de Tempo*: Monitore o total de horas trabalhadas no dia atual.
  - *Configuração Personalizada*: Defina suas horas de trabalho diárias nas configurações do aplicativo.
  - *Escolha de Idioma*: Com base nas configurações de idioma do seu dispositivo móvel, o aplicativo automaticamente seleciona o idioma (atualmente apenas Inglês e Português).
  - *Tema Personalizado*: Escolha se deseja que o aplicativo use cores claras (light mode) ou escuras (dark mode).
  
  ## Tecnologias Utilizadas
  
  O Aplicativo foi desenvolvido utilizando a linguagem Swift, usando um código 100% nativo. Isso significa que você não precisa instalar nenhuma dependência para executar o App.
  
  ## Como Usar
  
  1. Instale o aplicativo em seu dispositivo móvel.
  2. Configure suas horas de trabalho diárias nas configurações do aplicativo.
  3. O aplicativo calculará automaticamente o horário estimado de saída e o tempo trabalhado no dia atual.
  
  ## Principais Aprendizados e Desafios
  
  ### Programaticamente
  
  - Implementação de `Localização` no App para alternar entre inglês e português com base nas configurações de idioma do dispositivo móvel.
  - Implementação de um Tema (light/dark mode) configurável pelo usuário.
  - Utilização de `UserDefaults` para persistir os dados do tema (light/dark mode) escolhido e das configurações ajustadas.
  - Uso de `observers` para gerenciar a troca do tema.
  - Criação de um componente `Toast` para enviar notificações ao usuário, incluindo opções de configurações: `success`, `failed`, `alert` e `neutral`.
  - Implementação de animações de transição no componente `Toast`.
  
  ### No Storyboard
  
  - Utilização de um conjunto de cores adaptáveis ao tema escolhido (light/dark mode).
  - Uso de `stack view` para simplificar o gerenciamento de `constraints`.
  - Utilização de `User Defined Runtime Attributes` para a gestão da `localização` (troca de idioma) pelo storyboard.
  - Uso de `@IBInspectable` para facilitar a alteração do idioma em elementos do `storyboard`.
  
  ## Contribuições
  
  Contribuições para o aplicativo Ponto Diário são bem-vindas! Sinta-se à vontade para abrir issues, enviar pull requests ou sugerir novas funcionalidades.
  
  ## Licença
  
  Este projeto está licenciado sob a [Licença MIT](LICENSE).
  
  Baixe agora o aplicativo Ponto Diário e mantenha o controle do seu tempo de trabalho diário!
</details>
