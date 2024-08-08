// Draw Event de obj_menu
draw_set_font(global.font_main);

// Calcular largura e altura do menu
var _new_w = 0;
for (var i = 0; i < op_length; i++) {
    var _op_w = string_width(option[menu_level, i]);
    _new_w = max(_new_w, _op_w);
}
width = _new_w + op_border * 2;
height = op_border * 2 + string_height(option[0, 0]) + (op_length - 1) * op_space;

// Calcular posição do menu
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - width / 2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 - height / 2;

// Calcular posição do slider
slider_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - slider_width / 2;
slider_y = y + height + 50; // Ajuste para o slider

// Desenhar o fundo do menu
draw_sprite_ext(sprite_index, image_index, x, y, width / 64, height / 64, 0, c_white, 1);

// Desenhar as opções do menu
draw_set_valign(fa_top);
draw_set_halign(fa_left);
for (var i = 0; i < op_length; i++) {
    var _c = c_white;
    if (pos == i) {
        _c = c_orange;
    }
    draw_text_color(x + op_border, y + op_border + op_space * i, option[menu_level, i], _c, _c, _c, _c, 1);
}

// Desenhar o slider no menu de volume
if (menu_level == 2) {
    draw_set_color(c_white);
    draw_rectangle(slider_x, slider_y, slider_x + slider_width, slider_y + slider_height, false);
    draw_set_color(c_orange);
    draw_rectangle(slider_x, slider_y, slider_x + (slider_width * volume), slider_y + slider_height, false);
}

// Desenhar o texto de confirmação
if (menu_level == 3) {
    var confirm_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
    var confirm_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 - 100;

    // Desenhar o texto estático
    draw_set_color(c_white);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    draw_text(confirm_x, confirm_y, "Você deseja mesmo sair?");
}
