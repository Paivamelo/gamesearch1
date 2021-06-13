class Game {
  final String id;
  final String title;
  final String genre;
  final String image;
  final String dev;
  final String description;
  final String year;
  final String trailer;
  final String obter;

  Game(
      {this.id,
      this.title,
      this.genre,
      this.image,
      this.dev,
      this.description,
      this.year,
      this.trailer,
      this.obter});
}

final gameList = [
  Game(
      id: "1",
      title: "Among Us",
      genre: "Estratégia · ‎Sobrevivência",
      image: "assets/images/amongus.jpg",
      dev: "InnerSloth",
      description:
          "Jogue on-line ou via Wi-Fi local com 4 a 10 jogadores enquanto tenta preparar sua nave espacial para a partida, mas tenha cuidado, pois um deles será um impostor disposto a matar todos!"
          "\nOs tripulantes podem ganhar completando todas as tarefas ou descobrindo e votando no impostor fora do navio."
          "\nO Impostor pode usar sabotagem para causar o caos, facilitando as mortes e melhorando os álibis.",
      year: "Ano de Lançamento: 2018",
      trailer: "https://www.youtube.com/watch?v=NSJ4cESNQfE",
      obter: "https://store.steampowered.com/app/945360/Among_Us/"),
  Game(
      id: "2",
      title: "Bloons TD 6",
      genre: "Tower Defense · Estratégia em Tempo Real",
      image: "assets/images/bloonstd6.jpg",
      dev: "Ninja Kiwi",
      description: "Incrível Jogo de Defesa de Torres"
          "\nOs Bloons estão de volta e melhores que nunca! Prepare-se para um jogo de torres 3D massivo desenvolvido para dar horas e horas do melhor da estratégia."
          "\nPrepare sua defesa perfeita numa combinação de maravilhosas torres macaco, melhorias, heróis e habilidades ativáveis, e estoure até o último Bloon que venha em sua direção.",
      year: "Ano de Lançamento: 2018",
      trailer: "https://www.youtube.com/watch?v=dvcQY0v0Ow8",
      obter: "https://store.steampowered.com/app/960090/Bloons_TD_6/"),
  Game(
      id: "3",
      title: "Counter-Strike:\nGlobal Offensive",
      image: "assets/images/csgo.jpg",
      genre: "Tiro em Primeira Pessoa (FPS)‎",
      dev: "Valve Corporation, Hidden Path Entertainment",
      description:
          "Counter-Strike: Global Offensive (CS: GO) expandirá na jogabilidade de ação baseada em equipes na qual foi pioneiro quando foi lançado há 12 anos."
          "\nCS: GO contém novos mapas, personagens e armas, além de conter versões atualizadas de conteúdos do CS clássico (como de_dust2). Além disso, CS: GO introduzirá novos modos de jogo, criação de partidas (matchmaking), placares de líderes e mais.",
      year: "Ano de Lançamento: 2012",
      trailer: "https://www.youtube.com/watch?v=edYCtaNueQY",
      obter:
          "https://store.steampowered.com/app/730/CounterStrike_Global_Offensive/"),
  Game(
      id: "4",
      title: "Dead by Daylight",
      genre: "Survival Horror",
      image: "assets/images/dbd.jpeg",
      dev: "Behaviour Interactive",
      description:
          "Dead by Daylight é um jogo de terror multiplayer (4vs1) onde um jogador assume o papel do assassino selvagem e os outros quatro jogadores como sobreviventes, tentando escapar do assassino e evitar serem pegos e mortos.",
      year: "Ano de Lançamento: 2016",
      trailer: "https://www.youtube.com/watch?v=JGhIXLO3ul8",
      obter: "https://store.steampowered.com/app/381210/Dead_by_Daylight/"),
  Game(
      id: "5",
      title: "Fall Guys",
      genre: "Battle Royale · Corrida de Obstáculos · Plataforma",
      image: "assets/images/fallguys.jpg",
      dev: "Mediatonic",
      description:
          "Fall Guys é um party game para multijogador com até 60 jogadores online, em uma louca corrida free-for-all, com rounds e rounds cada vez mais caóticos até sobrar um único vencedor!",
      year: "Ano de Lançamento: 2020",
      trailer: "https://www.youtube.com/watch?v=Wj3dUvGLjNQ",
      obter:
          "https://store.steampowered.com/app/1097150/Fall_Guys_Ultimate_Knockout/"),
  Game(
      id: "6",
      title: "It Takes Two",
      genre: "Ação · Aventura",
      image: "assets/images/ittakestwo.jfif",
      dev: "Hazelight Studios",
      description:
          "Embarque na jornada mais maluca da sua vida em It Takes Two, uma aventura de plataforma inovadora criada exclusivamente para o jogo co-op. Convide um amigo ou amiga para se juntar de graça com o Passe de Amigo* e trabalhem juntos em uma variedade de desafios deliciosamente perturbadores. Jogue no papel do conflituoso casal Cody e May, dois humanos transformados em bonecos por um feitiço. Juntos, presos em um mundo fantástico onde o imprevisível está sempre à espreita, são obrigados a trabalhar para salvar seu relacionamento conturbado."
          "\nDomine habilidades de personagem únicas e interligadas em cada nível. Ajude e receba ajuda em obstáculos inesperados e momentos divertidos. Chute as caudas peludas de esquilos gângsteres, pilote um par de cuecas, banque o DJ em um clube noturno agitado e desça de trenó em um globo de neve mágico. Abrace uma história comovente e hilária em que a narrativa e o jogo tecem uma experiência metafórica única."
          "\nIt Takes Two é desenvolvido pelo premiado estúdio Hazelight, líder da indústria em jogos cooperativos. Eles estão prestes a levar você em uma viagem selvagem e maravilhosa, em que só uma coisa é certa: somos melhores juntos.",
      year: "Ano de Lançamento: 2021",
      trailer: "https://www.youtube.com/watch?v=ohClxMmNLQQ",
      obter: "https://store.steampowered.com/app/1426210/It_Takes_Two/"),
  Game(
      id: "7",
      title: "Minecraft",
      genre: "Sandbox · ‎Sobrevivência",
      image: "assets/images/minecraft.png",
      dev: "Mojang Studios",
      description:
          "Explore mundos infinitos e construa desde simples casas a grandiosos castelos. Jogue no modo criativo com recursos ilimitados ou minere fundo no mundo no modo sobrevivência, criando armas e armaduras para lutar contra criaturas perigosas. Crie, explore e sobreviva sozinho ou com amigos.",
      year: "Ano de Lançamento: 2011",
      trailer: "https://www.youtube.com/watch?v=MmB9b5njVbA",
      obter: "https://www.minecraft.net/pt-pt/get-minecraft"),
  Game(
      id: "8",
      title: "Outlast 2",
      genre: "Survival Horror",
      image: "assets/images/outlast2.jpg",
      dev: "Red Barrels Studio",
      description:
          "Outlast 2 traz-te Sullivan Knoth e os seus seguidores, que abandonaram o nosso mundo cruel para fundar Temple Gate, uma cidade situada nas profundezas do deserto, longe da civilização. Knoth e o seu rebanho estão a preparar-se para as adversidades do fim dos tempos, e tu estás no centro do furacão."
          "\nTu és Blake Langermann, um operador de câmara que trabalha com a sua esposa, Lynn. Sois ambos jornalistas de investigação, dispostos a correr riscos e ir até ao fundo para descobrir as histórias que mais ninguém se atreveria a investigar."
          "\nEstais a seguir o rastro das pistas que tiveram origem no assassinato aparentemente impossível de uma mulher grávida, apenas conhecida como Jane Doe."
          "\nA investigação conduziu-vos até ao centro do deserto do Arizona, a uma escuridão tão profunda que ninguém poderia lançar um fio de luz sobre ela, e a uma corrupção tão intensa que enlouquecer poderá ser a solução mais sensata.",
      year: "Ano de Lançamento: 2017",
      trailer: "https://www.youtube.com/watch?v=RTXbOh8urp4",
      obter: "https://store.steampowered.com/app/414700/Outlast_2/"),
  Game(
      id: "9",
      title: "Project Winter",
      genre: "Ação · Indie · Estratégia · Aventura",
      image: "assets/images/projectwinter.jpg",
      dev: "Other Ocean Group, Other Ocean Interactive",
      description:
          "O jogo perfeito para esfaquear seus amigos. Project Winter é um jogo multijogador para 8 pessoas com foco no engano social e na sobrevivência. A comunicação e o trabalho em equipe são essenciais para o objetivo final de fuga dos sobreviventes. Reúna recursos, conserte estruturas e enfrentem a selva juntos.",
      year: "Ano de Lançamento: 2019",
      trailer: "https://www.youtube.com/watch?v=kcX_clkApRo",
      obter: "https://store.steampowered.com/app/774861/Project_Winter/"),
  Game(
      id: "10",
      title: "Pummel Party",
      genre: "Ação · Casual · Indie",
      image: "assets/images/pummelparty.jpg",
      dev: "Rebuilt Games",
      description:
          "Pummel Party é um jogo de festa multijogador local e online para 4-8 jogadores. Golpeie amigos ou IA usando uma grande variedade de itens absurdos no modo de tabuleiro e compita para destruir amizades na coleção exclusiva de minijogos.",
      year: "Ano de Lançamento: 2018",
      trailer: "https://www.youtube.com/watch?v=oiYG0Ov5jKE",
      obter: "https://store.steampowered.com/app/880940/Pummel_Party/"),
  Game(
      id: "11",
      title: "Raft",
      genre: "Aventura · Indie · Simulação",
      image: "assets/images/raft.jpg",
      dev: "Redbeet Interactive",
      description:
          "Raft lança você e seus amigos em uma aventura oceânica épica! Sozinhos ou juntos, os jogadores lutam para sobreviver a uma perigosa viagem através de um vasto mar! Reúna destroços, vasculhe recifes e construa sua própria casa flutuante, mas cuidado com os tubarões comedores de gente!",
      year: "Ano de Lançamento: 2018",
      trailer: "https://www.youtube.com/watch?v=__w615A5lC4",
      obter: "https://store.steampowered.com/app/648800/Raft/"),
  Game(
      id: "12",
      title: "The Last of Us\nPart II",
      genre: "Ação · Aventura",
      image: "assets/images/thelastofus.jfif",
      dev: "Naughty Dog",
      description:
          "Cinco anos depois da jornada perigosa pelos Estados Unidos pós-pandêmicos, Ellie e Joel se estabelecem em Jackson, Wyoming. A vida em uma próspera comunidade de sobreviventes lhes trouxe paz e estabilidade, apesar da ameaça constante dos infectados e de outros sobreviventes mais desesperados. Quando um evento violento interrompe essa paz, Ellie embarca em uma jornada implacável para fazer justiça e encontrar uma solução. Enquanto vai atrás de cada um dos responsáveis, ela se confronta com as repercussões físicas e emocionais devastadoras de suas ações."
          "\nUma história complexa e emocionante"
          "\nVivencie os conflitos morais cada vez maiores criados pela busca implacável de Ellie por vingança. O ciclo de violência deixado em seu caminho desafiará suas noções de certo ou errado, bem ou mal e herói ou vilão."
          "\nUm mundo belo, mas perigoso"
          "\nEmbarque na jornada de Ellie, levando-a das montanhas e florestas tranquilas de Jackson até as ruínas exuberantes e cobertas pela vegetação da área metropolitana de Seattle. Encontre novos grupos de sobreviventes, ambientes desconhecidos e traiçoeiros e evoluções terríveis dos infectados. Criados pela versão mais recente do mecanismo da Naughty Dog, o mundo e os personagens mortais estão mais realistas e meticulosamente detalhados do que nunca."
          "\nPartida tensa e alucinante de ação e sobrevivência"
          "\nOs sistemas de partida novos e avançados atendem aos desafios de vida ou morte da jornada de Ellie por um mundo hostil. Vivencie sua batalha alucinante pela sobrevivência através de recursos aprimorados como combate corpo a corpo de alta intensidade, movimento fluido e ações furtivas dinâmicas. Uma ampla variedade de armas, itens de criação, habilidades e atualizações possibilitam que você personalize as habilidades de Ellie de acordo com seu estilo de jogo.",
      year: "Ano de Lançamento: 2020",
      trailer: "https://www.youtube.com/watch?v=W2Wnvvj33Wo",
      obter:
          "https://store.playstation.com/pt-br/product/UP9000-CUSA07820_00-THELASTOFUSPART2"),
  Game(
      id: "13",
      title: "Tricky Towers",
      genre: "Casual · Indie",
      image: "assets/images/trickytowers.jfif",
      dev: "WeirdBeard",
      description:
          "De robe brilhante e forças encantadas, é tempo de construir torres reforçadas em Tricky Towers!"
          "\nEmpilhe blocos para criar uma torre resistente, enquanto tenta derrubar as dos adversários. Lance magias que reforcem sua estrutura e afaste os feitiços das trevas dos rivais neste jogo de grupo frenético baseado na física."
          "\nJogue com até 4 amigos no multijogador local, ou desafie jogadores em todo o mundo em uma batalha online. Treine suas habilidades com extensivos testes para um só jogador e crave recordes nos placares de líderes."
          "\nCom feitiços voando por todo lado e blocos desabando, Tricky Towers é certeza de viver a experiência da mais caótica diversão!",
      year: "Ano de Lançamento: 2016",
      trailer: "https://www.youtube.com/watch?v=Xn6ltQrKy5I",
      obter: "https://store.steampowered.com/app/437920/Tricky_Towers/"),
  Game(
      id: "14",
      title: "Ultimate Chicken\nHorse",
      genre: "Ação · Casual · Indie",
      image: "assets/images/ultimatechickenhorse.jpg",
      dev: "Clever Endeavour Games",
      description:
          "Já desejou ser um cavalo que salta por paredes, se esquiva de flechas e faz armadilhas, superando seus amigos animais numa corrida por uma pista de obstáculos que todos vocês criaram juntos?"
          "\nDesejo concedido!"
          "\nO Ultimate Chicken Horse é um jogo de plataforma coletivo, no qual você e seus amigos criam a fase enquanto jogam, colocando armadilhas mortais antes de tentar chegar ao fim da fase. Se você conseguir, mas seus amigos não, você marca pontos! Jogue online ou localmente com seus companheiros animais e teste uma ampla variedade de plataformas em todos os tipos de lugares para encontrar novas formas de provocar seus amigos.",
      year: "Ano de Lançamento: 2016",
      trailer: "https://www.youtube.com/watch?v=FYaE_xw4krw",
      obter:
          "https://store.steampowered.com/app/386940/Ultimate_Chicken_Horse/"),
  Game(
      id: "15",
      title: "Valorant",
      genre: "Tiro em Primeira Pessoa (FPS)",
      image: "assets/images/valorant.jpg",
      dev: "Riot Games",
      description: "DESAFIE SEUS LIMITES"
          "\nMisture o seu estilo e experiência em um cenário global e competitivo. Você terá 13 rodadas para atacar e defender com disparos certeiros e habilidades táticas. Com apenas uma vida por rodada, você deve pensar mais rápido que o oponente se quiser sobreviver. Encare inimigos nos modos Competitivo e Sem Ranque, além da Disputa da Spike e do Mata-Mata!"
          "\n\nA CRIATIVIDADE É SUA MELHOR ARMA."
          "\nMais do que armas e munição, VALORANT inclui agentes com habilidades adaptativas, rápidas e letais, que criam oportunidades para você exibir sua mecânica de tiro. Cada Agente é único, assim como os momentos de destaque de cada partida!"
          "\n\nBATALHE AO REDOR DO MUNDO"
          "\nCada mapa serve como um palco para mostrar sua criatividade. Os mapas são feitos sob medida para estratégias de equipe, jogadas espetaculares e momentos eletrizantes. Faça as jogadas que todo mundo vai tentar imitar no futuro!",
      year: "Ano de Lançamento: 2020",
      trailer: "https://www.youtube.com/watch?v=e_E9W2vsRbQ",
      obter: "https://playvalorant.com/pt-br/")
];
