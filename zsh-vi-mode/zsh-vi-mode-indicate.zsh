autoload -U add-zle-hook-widget

function mode_update {
    case "${KEYMAP}" in
        vicmd)
            case "${REGION_ACTIVE}" in
                1)
                    VI_KEYMAP="VISUAL"
                    ;;
                2)
                    VI_KEYMAP="V-LINE"
                    ;;
                *)
                    VI_KEYMAP="NORMAL"
                    ;;
            esac
            ;;
        viins|main)
            if [[ "${ZLE_STATE}" == *overwrite* ]]; then
                VI_KEYMAP="REPLACE"
            else
                VI_KEYMAP="INSERT"
            fi
            ;;
    esac

}
add-zle-hook-widget zle-line-pre-redraw mode_update

