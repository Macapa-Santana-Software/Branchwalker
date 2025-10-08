/// OBJ_TERMINAL - CREATE
interaction_radius = 56; // distância pra mostrar a dica
show_hint = false;

menu_open = false;
sel = 0; // card selecionado (0..2)

card_title = ["git init", "git init -b main", "git init --bare"];
card_desc  = [
    "Cria um repositório no diretório atual.",
    "Inicializa já com a branch 'main'.",
    "Repositório bare (sem working tree)."
];

// feedback (“toast”)
toast_text  = "";
toast_timer = 0; // frames (60 = ~1s @60fps)
