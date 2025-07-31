module LogLevels

let message (logLine: string) : string =
    let splittened = logLine.Split(":")[1]
    splittened.Trim()

let logLevel (logLine: string) : string =
    let splittened = logLine.Split(":")[0]
    let trimmed = splittened.Trim('[', ']')
    trimmed.ToLower()

let reformat (logLine: string) : string =
    let m = message logLine
    let l = logLevel logLine
    sprintf "%s (%s)" m l
