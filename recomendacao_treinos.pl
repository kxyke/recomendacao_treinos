% recomendacao_treinos.pl
% Sistema Especialista para Recomendações de Treinos de Academia
% Desenvolvido por: [Seu Nome Aqui]

% Base de Conhecimento
objetivo(ganhar_massa).
objetivo(emagrecer).
objetivo(condicionamento).

experiencia(iniciante).
experiencia(intermediario).
experiencia(avancado).

disponibilidade(tempo_limitado).
disponibilidade(tempo_moderado).
disponibilidade(tempo_amplo).

% Regras de treino
treino(hipertrofia) :-
    objetivo(ganhar_massa), experiencia(intermediario).

treino(perda_de_peso) :-
    objetivo(emagrecer), disponibilidade(tempo_limitado).

treino(condicionamento_fisico) :-
    objetivo(condicionamento), experiencia(iniciante).

% Função principal para recomendar treino
recomendacao :-
    write('Bem-vindo ao Sistema de Recomendações de Treinos!'), nl,
    perguntar(objetivo),
    perguntar(experiencia),
    perguntar(disponibilidade),
    (
        treino(Treino), !,
        format('Plano de treino recomendado: ~w~n', [Treino])
    ;
        write('Não foi possível sugerir um plano de treino específico. Consulte um personal trainer.'), nl
    ),
    write('Desenvolvido por: [Seu Nome Aqui]').

% Função para perguntar ao usuário
perguntar(Questao) :-
    format('Qual seu ~w? ', [Questao]),
    read(Resposta),
    assertz(Questao(Resposta)).
