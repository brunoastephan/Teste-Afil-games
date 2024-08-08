// Evento: Create de obj_menu
width = 64;
height = 104;

op_border = 16;
op_space = 64;

pos = 0;

option[0, 0] = "Jogar";
option[0, 1] = "Configurações";
option[0, 2] = "Sair";

option[1, 0] = "Volume";
option[1, 1] = "Tela Cheia";
option[1, 2] = "Voltar";

option[2, 0] = "Voltar";

option[3, 0] = "Sim";
option[3, 1] = "Não";

op_length = 0;
menu_level = 0;

// Inicializar variáveis do slider
slider_width = 200;
slider_height = 20;
volume = 1.0;
slider_selected = false;

// Inicializar variável de tela cheia
fullscreen_mode = window_get_fullscreen(); // Inicializa com o valor atual

// Inicializar variável de música
musica_id = -1; // Inicializa como um valor inválido

// Tocar a música, se ainda não estiver tocando
if (musica_id == -1) {
    musica_id = audio_play_sound(musica, 1, true);
}
