from lxml import etree
import random

def get_etree(xml_path: str):
    xml_doc: etree = etree.parse(xml_path)
    return xml_doc

def transform_file(xml_doc):
    dtd = etree.DTD("schemas/film_lib.dtd")
    print(f"Валидация DTD: {dtd.validate(xml_doc)}")

    xsd = etree.XMLSchema(etree.parse("schemas/film_lib.xsd"))
    print(f"Валидация XSD: {xsd.validate(xml_doc)}")

    txt_transform = etree.XSLT(etree.parse("xslt_transformation/txt.xsl"))

    print("\nРезультат преобрезования в .txt:")
    print(txt_transform(xml_doc))

    html_transform = etree.XSLT(etree.parse("xslt_transformation/html.xsl"))
    res = html_transform(xml_doc)

    with open("film_data.html", "wb") as f:
        f.write(etree.tostring(res, pretty_print=True))

def select_random_films(xml_file, query, count):
    films = exec_query(xml_file, query)
    print(f"\n\nЗапрос: {query}. Количество случайных фильмов: {count}")
    print(f"\nРезультат:")
    random_films = random.sample(films, count)

    for film in random_films:
        print(film.find('title').text)

def exec_query_and_output(xml: etree, query: str) -> None:
    print(f"\n\nЗапрос: {query}")
    print(f"\nРезультат:")
    result: etree = xml.xpath(query)
    for film in result:
        print(film.find("title").text)

def exec_query(xml: etree, query: str):
    result: etree = xml.xpath(query)
    return result


    
if __name__ == "__main__":
    xml_doc = get_etree("film_data.xml")

    transform_file(xml_doc)
    exec_query_and_output(xml_doc, "/films/film[genres/genre='Приключения']")
    exec_query_and_output(xml_doc, "/films/film[count(cast/actor) > 8]")
    exec_query_and_output(xml_doc, "/films/film[directors/director = 'Квентин Тарантино' and cast/actor = 'Квентин Тарантино']")
    select_random_films(xml_doc, "/films/film[genres/genre='Драма']", 3)
    exec_query_and_output(xml_doc, '/films/film[viewers >= 15000000 and count(cast/actor) > 9 and contains(genres, "Драма")]')
