#!/usr/bin/env python3
from urllib.request import Request, urlopen
import json
import os
import logging
import datetime
from bs4 import BeautifulSoup


logger = logging.getLogger()
logging.basicConfig()
logger.setLevel(logging.INFO)


def _handler(base_url, record):
    logger.info("Making HTTP call: %s", base_url + "/" + record)
    collections = get_bin_collections_from_html(base_url + '/' + record)
    logger.info("Collections: %s", collections)

    return collections


def get_bin_collections_from_html(url):
    user_agent = 'Mozilla/5.0 (Windows NT 6.1; Win64; x64)'

    req = Request(url)
    req.add_header('User-Agent', user_agent)

    fp = urlopen(req).read()
    page = fp.decode("utf8")

    soup = BeautifulSoup(page, features="html.parser")
    soup.prettify()

    data = []

    service_details = soup.find("div", {"class": 'serviceDetails'})

    for bins in service_details.findAll("div", {"class": 'bin-dir-snip'}):
        
        lis = []
        for ul in bins.findAll('ul'):

            for li in ul.findAll('li'):
                if li.findAll('ul'):
                    break
                lis.append(li)

        for li in lis:
            bin_type = li.h4.find(text=True, recursive=False)
            data.append(str(bin_type.strip()))
    return data


if __name__ == '__main__':
    output_folder_name = os.environ.get('OUTPUT_FOLDER_NAME')
    output = _handler(os.environ.get('BASE_URL'), os.environ.get('DIRECTORY_RECORD'))

    bin_colors = {
        "blue": "Paper and card",
        "green": "Non-Recyclable Waste.",
        "gray": "Glass, cans and plastics",
        "burgundy": "Food and garden"
    }
    all_collections = []
    active_collections = []
    for bin_color in bin_colors:
        is_active = bin_colors.get(bin_color) in output
        result = {
            "binColor": bin_color,
            "binType": bin_colors.get(bin_color),
            "collection": is_active,
            "updated": str(datetime.datetime.utcnow())
        }
        all_collections.append(result)
        if is_active:
            active_collections.append(result)
        full_file_name = os.path.join(output_folder_name, bin_color + ".json")
        with open(full_file_name, 'w+') as f:
            json.dump(result, f)

    with open(os.path.join(output_folder_name, "all.json"), 'w+') as f:
        json.dump(all_collections, f)
    with open(os.path.join(output_folder_name, "active.json"), 'w+') as f:
        json.dump(active_collections, f)
