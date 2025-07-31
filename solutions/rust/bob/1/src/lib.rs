pub enum Prompt {
    Question,
    Yelling,
    YellingQuestion,
    Silence,
    SomethingElse,
}
use Prompt::*;

pub struct Conversation {
    prompt: Prompt,
}

impl Conversation {
    pub fn prompt(dialogue: &str) -> Conversation {
        let dialogue = dialogue.trim();
        let alpha_chars = dialogue
            .chars()
            .filter(|c| c.is_alphabetic())
            .collect::<Vec<_>>();

        let is_question = dialogue.ends_with('?');

        let is_yelling = alpha_chars.len() > 0
            && alpha_chars
                .iter()
                .fold(true, |acc, c| acc && c.is_uppercase());

        let is_silence = dialogue.len() == 0;

        let input_type = match (is_question, is_yelling, is_silence) {
            (true, true, _) => YellingQuestion,
            (true, _, _) => Question,
            (_, true, _) => Yelling,
            (_, _, true) => Silence,
            _ => SomethingElse,
        };

        Conversation { prompt: input_type }
    }

    pub fn reply(&self) -> &str {
        match self.prompt {
            Question => "Sure.",
            Yelling => "Whoa, chill out!",
            YellingQuestion => "Calm down, I know what I'm doing!",
            Silence => "Fine. Be that way!",
            _ => "Whatever.",
        }
    }
}

pub fn reply(message: &str) -> String {
    let convo = Conversation::prompt(message);
    String::from(convo.reply())
}
