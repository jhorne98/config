#!/usr/bin/python3

import sys
import requests
import re
import subprocess
from bs4 import BeautifulSoup

def copy_to_clipboard(text):
    # Command to copy text to clipboard using xclip
    command = ['xclip', '-selection', 'c']  # -c is for clipboard selection, use -i for primary
    try:
        process = subprocess.run(command, input=text.encode(), check=True, text=False)
        print("Text copied to clipboard successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to copy text: {e}")
    except FileNotFoundError:
        print("xclip not found. Please ensure xclip is installed and available in your PATH.")

def main():
    rss_re = re.compile(r'\S+feed|\S+rss')
    script_rss_re = re.compile(r'(?:https?:\/\/)?[^\s"]+\.rss')

    top_url = sys.argv[1]
    if top_url[-1] == '/': # Trim leading forward slash
        top_url = top_url[:-1]
    resp = requests.get(top_url)

    if resp.status_code == 200:
        soup = BeautifulSoup(resp.text, 'html.parser')

        # Find all <a> tags in the document
        urls = []
        for url in soup.find_all('a', href=True):
            # Extract and print the URL
            urls.append(url['href'])

        # Find all <link> tags in the document
        for url in soup.find_all('link', href=True):
            # Extract and print the URL
            urls.append(url['href'])


        filtered_urls = [url for url in urls if rss_re.search(url)]
        for i, url in enumerate(filtered_urls):
            if 'https://' not in url:
                filtered_urls[i] = top_url + url

        # Find any rss links inside <script> tags
        for script in soup.find_all('script'):
            match = script_rss_re.search(script.text)
            if match is not None:
                filtered_urls.append(match.group())

        if len(filtered_urls) > 0:
            for url in filtered_urls:
                print(url)
            copy_to_clipboard(filtered_urls[0])
        else:
            print(f"Failed to find any RSS urls")

    else:
        print(f"Failed to retrieve the page with code: {resp.status_code}")

if __name__ == "__main__":
    main()
