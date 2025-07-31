module GradeSchool

type School = Map<int, string list>

let empty: School = Map.empty

let add (student: string) (grade: int) (school: School) : School =
    let studentsInGrade = Map.tryFind grade school |> Option.defaultValue []

    school
    |> Map.tryFindKey (fun _ studentList -> studentList |> List.contains student)
    |> function
        | Some _ -> school
        | None -> Map.add grade (student :: studentsInGrade) school

let roster (school: School) : string list =
    Map.toList school
    |> List.sortBy fst
    |> List.map (snd >> List.sort)
    |> List.concat

let grade (number: int) (school: School) : string list =
    school
    |> Map.tryFind number
    |> function
        | Some students -> students |> List.sort
        | None -> []
