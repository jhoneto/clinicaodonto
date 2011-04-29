(function(a){
    a.jgrid = {
        defaults: {
            recordtext: "Exibindo {0} - {1} de {2}",
            emptyrecords: "Sem registro para mostrar",
            loadtext: "Carregando...",
            pgtext: "Page {0} of {1}"
        },
        search: {
            caption: "Procurar...",
            Find: "Procurar",
            Reset: "Resetar",
            odata: ["equal", "not equal", "less", "less or equal", "greater", "greater or equal", "begins with", "does not begin with", "is in", "is not in", "ends with", "does not end with", "contains", "does not contain"],
            groupOps: [{
                op: "AND",
                text: "all"
            }, {
                op: "OR",
                text: "any"
            }],
            matchText: " match",
            rulesText: " rules"
        },
        edit: {
            addCaption: "Incluir",
            editCaption: "Alterar",
            bSubmit: "Enviar",
            bCancel: "Cancelar",
            bClose: "Fechar",
            saveData: "Data has been changed! Save changes?",
            bYes: "Yes",
            bNo: "No",
            bExit: "Cancel",
            msg: {
                required: "Campo � requerido",
                number: "Por favor, informe um n�mero v�lido",
                minValue: "valor deve ser igual ou maior que ",
                maxValue: "valor deve ser menor ou igual a",
                email: "este e-mail n�o � v�lido",
                integer: "Por favor, informe um valor inteiro",
                date: "Por favor, informe uma data valida",
                url: "is not a valid URL. Prefix required ('http://' or 'https://')"
            }
        },
        view: {
            caption: "Visualizar registro",
            bClose: "Fechar"
        },
        del: {
            caption: "Excluir",
            msg: "Excluir registros selecionado(s)?",
            bSubmit: "Excluir",
            bCancel: "Cancelar"
        },
        nav: {
            edittext: " ",
            edittitle: "Alterar registro selecionado",
            addtext: " ",
            addtitle: "Incluir novo registro",
            deltext: " ",
            deltitle: "Excluir registro selecionado",
            searchtext: " ",
            searchtitle: "Procurar registros",
            refreshtext: "",
            refreshtitle: "Recarrgando Tabela",
            alertcap: "Aviso",
            alerttext: "Por favor, selecione um registro",
            viewtext: "",
            viewtitle: "Visualizar registro selecionado"
        },
        col: {
            caption: "Mostrar/Esconder Colunas",
            bSubmit: "Enviar",
            bCancel: "Cancelar"
        },
        errors: {
            errcap: "Erro",
            nourl: "Nenhuma URL defenida",
            norecords: "Sem registros para exibir",
            model: "Length of colNames <> colModel!"
        },
        formatter: {
            integer: {
                thousandsSeparator: " ",
                defaultValue: "0"
            },
            number: {
                decimalSeparator: ".",
                thousandsSeparator: " ",
                decimalPlaces: 2,
                defaultValue: "0.00"
            },
            currency: {
                decimalSeparator: ".",
                thousandsSeparator: " ",
                decimalPlaces: 2,
                prefix: "",
                suffix: "",
                defaultValue: "0.00"
            },
            date: {
                dayNames: ["Sun", "Mon", "Tue", "Wed", "Thr", "Fri", "Sat", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
                monthNames: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                AmPm: ["am", "pm", "AM", "PM"],
                S: function(b){
                    return b < 11 || b > 13 ? ["st", "nd", "rd", "th"][Math.min((b - 1) % 10, 3)] : "th"
                },
                srcformat: "Y-m-d",
                newformat: "d/m/Y",
                masks: {
                    ISO8601Long: "Y-m-d H:i:s",
                    ISO8601Short: "Y-m-d",
                    ShortDate: "n/j/Y",
                    LongDate: "l, F d, Y",
                    FullDateTime: "l, F d, Y g:i:s A",
                    MonthDay: "F d",
                    ShortTime: "g:i A",
                    LongTime: "g:i:s A",
                    SortableDateTime: "Y-m-d\\TH:i:s",
                    UniversalSortableDateTime: "Y-m-d H:i:sO",
                    YearMonth: "F, Y"
                },
                reformatAfterEdit: false
            },
            baseLinkUrl: "",
            showAction: "",
            target: "",
            checkbox: {
                disabled: true
            },
            idName: "id"
        }
    }
})(jQuery);
