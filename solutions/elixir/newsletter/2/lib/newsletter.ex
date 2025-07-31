defmodule Newsletter do
  def read_emails(path) do
    File.read!(path)
    |> String.split("\n")
    |> Enum.reject(&(String.trim(&1) |> String.length() == 0))
  end

  def open_log(path), do: File.open!(path, [:write])

  def log_sent_email(pid, email), do: IO.puts(pid, email)

  def close_log(pid), do: File.close(pid)

  def send_newsletter(emails_path, log_path, send_fun) do
    log_pid = open_log(log_path)

    read_emails(emails_path)
    |> Enum.each(fn email_addr ->
      if send_fun.(email_addr) == :ok do
        log_sent_email(log_pid, email_addr)
      end
    end)

    close_log(log_pid)
  end
end
