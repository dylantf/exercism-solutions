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
        let msg = dialogue.trim();

        let is_question = msg.ends_with('?');

        let is_yelling = msg == msg.to_uppercase() && msg.chars().any(|c| c.is_alphabetic());

        let is_silence = msg.len() == 0;

        let input_type = match (is_question, is_yelling, is_silence) {
            (true, true, _) => YellingQuestion,
            (true, _, _) => Question,
            (_, true, _) => Yelling,
            (_, _, true) => Silence,
            _ => SomethingElse,
        };

        Conversation { prompt: input_type }
    }

    pub fn reply(&self) -> &'static str {
        match self.prompt {
            Question => "Sure.",
            Yelling => "Whoa, chill out!",
            YellingQuestion => "Calm down, I know what I'm doing!",
            Silence => "Fine. Be that way!",
            _ => "Whatever.",
        }
    }
}

pub fn reply(message: &str) -> &str {
    let convo = Conversation::prompt(message);
    convo.reply()
}
