// Evento: Step de obj_menu
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_enter);

// Detectar a posição do mouse
var mouse_x_pos = mouse_x;
var mouse_y_pos = mouse_y;

// Calcular o índice da opção sobre a qual o mouse está
var mouse_over_option = floor((mouse_y_pos - y - op_border) / op_space);

if (mouse_x_pos > x && mouse_x_pos < x + width && mouse_y_pos > y && mouse_y_pos < y + height) {
    if (mouse_over_option >= 0 && mouse_over_option < op_length) {
        pos = mouse_over_option;

        if (mouse_check_button_pressed(mb_left)) {
            accept_key = true; // Trate o clique do mouse como uma seleção
        }
    }
}

op_length = array_length(option[menu_level]);

pos += down_key - up_key;
if (pos >= op_length) {
    pos = 0;
}
if (pos < 0) {
    pos = op_length - 1;
}

if (accept_key) {
    var _sml = menu_level;

    switch (menu_level) {
        case 0:
            switch (pos) {
                case 0: room_goto_next(); break;
                case 1: menu_level = 1; break;
                case 2: confirm_exit = true; menu_level = 3; break; // Ir para o menu de confirmação
            }
            break;

        case 1:
            switch (pos) {
                case 0: menu_level = 2; break; // Novo menu para controle de volume
                case 1:
                    // Alternar entre tela cheia e modo janela
                    fullscreen_mode = !fullscreen_mode;
                    window_set_fullscreen(fullscreen_mode);
                    option[1, 1] = fullscreen_mode ? "Minimizar" : "Tela Cheia";
                    break;
                case 2: menu_level = 0; break;
            }
            break;

        case 2:
            switch (pos) {
                case 0: menu_level = 1; break; // Voltar para o menu de configurações
            }
            break;

        case 3:
            switch (pos) {
                case 0: game_end(); break; // Sair do jogo
                case 1: menu_level = 0; break; // Voltar para o menu principal
            }
            break;
    }

    if (_sml != menu_level) {
        pos = 0;
    }

    // Atualizar o comprimento das opções para o novo menu_level
    op_length = array_length(option[menu_level]);
}

// Controle de mouse para o slider
if (mouse_check_button(mb_left) && menu_level == 2 && mouse_x >= slider_x && mouse_x <= slider_x + slider_width && mouse_y >= slider_y && mouse_y <= slider_y + slider_height) {
    volume = (mouse_x - slider_x) / slider_width;
    if (musica_id != -1) {
        audio_sound_gain(musica_id, volume, 0);
    }
}

// Controle de teclado para o slider
if (menu_level == 2) {
    if (keyboard_check(vk_left)) {
        volume -= 0.01;
    }
    if (keyboard_check(vk_right)) {
        volume += 0.01;
    }
    volume = clamp(volume, 0, 1);
    if (musica_id != -1) {
        audio_sound_gain(musica_id, volume, 0);
    }
}
