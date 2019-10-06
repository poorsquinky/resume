
# resume

This is the repository for my resume, including the tools I use to render it in HTML from Markdown.

Take a look at <https://erikstambaugh.com/resume/> to see it in its current state.


### Sample `~/.resumedata.yml` format:

    %YAML 1.2
    ---

    # Replace the content of each of the listed fields/subfields with what's here.  Add fields if they're missing

    hidden_fields_by_heading:
            contact:
                Address: |
                    123 Fake St.
                    Night City, CA 98765
                Phone:      +1 (949) 555-1212

    # Replace tag content.  This way we can have text in the Markdown version, and icons in the HTML one.

    replace_content_global:
        Github:
            '<svg height="1rem" width="1rem" viewBox="0 0 16 16" version="1.1" aria-hidden="true"><title>Github</title><path fill-rule="evenodd" fill="white" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"></path></svg>'
        Web site:
            '<svg height="1rem" width="1rem" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-link"><title>Web Site</title><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></svg>'
        Email:
            '<svg height="1rem" width="1rem" viewBox="0 0 36 25" version="1.1"><title>Email</title><g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g id="Social-Icons---Isolated" transform="translate(-394.000000, -1411.000000)" fill="white"><path d="M394,1413.16232 L394,1433.54761 C394,1434.65665 394.811742,1435.55548 395.930065,1435.55548 L427.744774,1435.55548 C428.861935,1435.55548 429.674839,1434.64619 429.674839,1433.54761 L429.674839,1413.16232 C429.674839,1411.94529 428.947871,1411 427.744774,1411 L395.930065,1411 C394.680516,1411 394,1411.96852 394,1413.16232 M396.933419,1414.93794 C396.933419,1414.44671 397.23071,1414.16568 397.705677,1414.16568 C397.999484,1414.16568 409.560129,1421.4911 410.260387,1421.92077 L412.069677,1423.04606 C412.643355,1422.66168 413.219355,1422.33303 413.813935,1421.93471 C415.027484,1421.15897 425.825161,1414.16568 426.122452,1414.16568 C426.598581,1414.16568 426.89471,1414.44671 426.89471,1414.93794 C426.89471,1415.45819 425.892516,1415.97497 425.239871,1416.37329 C421.139355,1418.87239 417.04,1421.59677 412.980129,1424.18877 C412.743226,1424.34903 412.284516,1424.69161 411.940774,1424.63935 C411.557548,1424.58013 399.793677,1417.02245 397.653419,1415.76361 C397.331742,1415.57432 396.933419,1415.40129 396.933419,1414.93794" id="Email"></path></g></g></svg>'
        Address:
            '<svg width="1rem" height="1rem" viewBox="0 0 14 20" version="1.1"><title>Address</title><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" transform="translate(-5, -2)"><polygon points="0 0 24 0 24 24 0 24"></polygon><path d="M12,2 C8.13,2 5,5.13 5,9 C5,13.17 9.42,18.92 11.24,21.11 C11.64,21.59 12.37,21.59 12.77,21.11 C14.58,18.92 19,13.17 19,9 C19,5.13 15.87,2 12,2 Z M12,11.5 C10.62,11.5 9.5,10.38 9.5,9 C9.5,7.62 10.62,6.5 12,6.5 C13.38,6.5 14.5,7.62 14.5,9 C14.5,10.38 13.38,11.5 12,11.5 Z" fill="white"></path></g></svg>'
        Phone:
            '<svg width="1rem" height="1rem" viewBox="0 0 18 18" version="1.1"><title>Phone</title><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" transform="translate(-3,-3)"><polygon points="0 0 24 0 24 24 0 24"></polygon><path d="M19.23,15.26 L16.69,14.97 C16.08,14.9 15.48,15.11 15.05,15.54 L13.21,17.38 C10.38,15.94 8.06,13.63 6.62,10.79 L8.47,8.94 C8.9,8.51 9.11,7.91 9.04,7.3 L8.75,4.78 C8.63,3.77 7.78,3.01 6.76,3.01 L5.03,3.01 C3.9,3.01 2.96,3.95 3.03,5.08 C3.56,13.62 10.39,20.44 18.92,20.97 C20.05,21.04 20.99,20.1 20.99,18.97 L20.99,17.24 C21,16.23 20.24,15.38 19.23,15.26 Z" fill="white"></path></</svg>'


