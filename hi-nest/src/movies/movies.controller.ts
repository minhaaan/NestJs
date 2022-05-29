import { Body, Controller, Delete, Get, Param, Post } from '@nestjs/common';

@Controller('movies')
export class MoviesController {
  @Get()
  getAll() {
    return 'return all';
  }

  @Get('/:id')
  getOne(@Param('id') movieId: string) {
    return `this will return one movie ${movieId}`;
  }

  @Post()
  create(@Body() movieData: any) {
    console.log(movieData);
    return movieData;
  }

  @Delete('/:id')
  remove(@Param('id') movieId: string) {
    return `remove a movie ${movieId}`;
  }
}
