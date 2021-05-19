import { TestBed } from '@angular/core/testing';

import { WsocketsService } from './wsockets.service';

describe('WsocketsService', () => {
  let service: WsocketsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(WsocketsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
