// Evento: Clean Up de obj_menu
if (musica_id != -1) {
    audio_stop_sound(musica_id);
    musica_id = -1; // Reset para o valor inválido
}
