Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A650531546
	for <lists+squashfs-devel@lfdr.de>; Mon, 23 May 2022 19:30:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1ntBsq-0000zC-ST; Mon, 23 May 2022 17:30:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nt22c-0007ZH-Of
 for squashfs-devel@lists.sourceforge.net; Mon, 23 May 2022 06:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ivbtveK1b9xDXzTHiB1+vrFrI8F8zLJqf42Jq8NTt84=; b=bXJlSaogLLT4islCCTv1RQXAEP
 zW1pj48219/YpS2IDVURLmJNYc3VipUnVzS87Rr1DA3q+sn7DL6Z82mehckr9tl5tGzij/qjwY4MK
 DuJU0PTM5xmcpJpFB3vW+QavtVUAayd58J2MXc47guXGDaglNiEtueg+sDJlXm0aoLuI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ivbtveK1b9xDXzTHiB1+vrFrI8F8zLJqf42Jq8NTt84=; b=L
 pk8qiOnsAhEufMOcPQwck7QX0e5p0iiox3Sg6IiZnAGO0xTEvZanRbE6BsC00KO8OrQU5oHJYpYb7
 nREoeuSnlMRumDX/GmZcdFNjcN3RMeP96Im1NsvKOuMWrA3acgmgOHJe8bu6b3dZEiBoKVijTqNR0
 ndPxqrlkApa33630=;
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nt22c-0005ZO-Cz
 for squashfs-devel@lists.sourceforge.net; Mon, 23 May 2022 06:59:46 +0000
Received: by mail-pl1-f177.google.com with SMTP id 10so8830921plj.0
 for <squashfs-devel@lists.sourceforge.net>;
 Sun, 22 May 2022 23:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ivbtveK1b9xDXzTHiB1+vrFrI8F8zLJqf42Jq8NTt84=;
 b=JrZU0mAtWhyHtnGWfcq4jisbYZkDYfFSSaRvW7hUCBHB5+ZPnkL8XNaBlBWSPG/xHI
 mMEVGvxKf3niaQ4D8oZgj3wzKbz+5/rwz5eyALJmx7eG0kQCD/9RgoZ2mTWfN6QcdKdj
 Do+KMx/FsUkhPKjbh58S9261HdHS7Mf3Zxa6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ivbtveK1b9xDXzTHiB1+vrFrI8F8zLJqf42Jq8NTt84=;
 b=lgcoLu0GDzBzaSO+GsTOKRGJPUWTq+W6bD+8CGJErp/QZl2ehkSlfig6AaBUhJWfhI
 XYVROPxPcmoIXpXkmLF43ISMhewB8aMOO28B46cu9dBpN9C32f5kwx0dWCf4ffZRrOPY
 6+fdEN7YJntt2h3z2/Xe/VBhZkMqWviU6GGITCpD+g36f/7s7CBLNmCMyHaxnhKoMAC/
 P1LVh6CUekibhA71SqQsLohXNnUo2CvDWGaQM4clKTJedvxUYKnMVuAarz7k76g+NvVA
 uCcEhGLeLx5PNHVMV7Z/jmbpLj5GeLJMotxyYtflvowu3DQBtA16ZYPavZmNmEri9S6G
 X0kw==
X-Gm-Message-State: AOAM533oggrrGnbGBXudXxyto5TSn0UV2u5yR+nzhJv0PYG6iFZXtEDd
 nVV165Yqy8a3FZY7EH/eA+r4lg==
X-Google-Smtp-Source: ABdhPJyT2PNg67dmHFmoI/Hj5YZVhAGhIMtKKzgeiGQjxfk1/InZ7XWSgzgldrF617vESUKPBhniDQ==
X-Received: by 2002:a17:902:a50f:b0:162:28c6:bfac with SMTP id
 s15-20020a170902a50f00b0016228c6bfacmr2850974plq.99.1653289180789; 
 Sun, 22 May 2022 23:59:40 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:76d5:494d:1690:d003])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a629402000000b005180f4733a8sm3099527pfe.106.2022.05.22.23.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 23:59:39 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Phillip Lougher <phillip@squashfs.org.uk>,
 Matthew Wilcox <willy@infradead.org>,
 Xiongwei Song <Xiongwei.Song@windriver.com>
Date: Mon, 23 May 2022 14:59:07 +0800
Message-Id: <20220523065909.883444-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit c1f6925e1091("mm: put readahead pages in cache
 earlier")
 requires fs to implement readahead callback. Otherwise there will be a
 performance
 regression. Commit 9eec1d897139("squashfs: provide backing_dev_info in order
 to disable read-ahead") mitigates the performance drop issue for squashfs
 by closing readahead for it. 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.177 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.177 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nt22c-0005ZO-Cz
X-Mailman-Approved-At: Mon, 23 May 2022 17:30:18 +0000
Subject: [Squashfs-devel] [PATCH v3 0/3] Implement readahead for squashfs
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "squashfs-devel @ lists . sourceforge . net"
 <squashfs-devel@lists.sourceforge.net>, Zhang Yi <yi.zhang@huawei.com>,
 linux-kernel@vger.kernel.org, "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Commit c1f6925e1091("mm: put readahead pages in cache earlier") requires
fs to implement readahead callback. Otherwise there will be a
performance regression.

Commit 9eec1d897139("squashfs: provide backing_dev_info in order to
disable read-ahead") mitigates the performance drop issue for squashfs
by closing readahead for it.

This series implements readahead callback for squashfs. The previous
discussion are in [1] and [2].

[1] https://lore.kernel.org/all/CAJMQK-g9G6KQmH-V=BRGX0swZji9Wxe_2c7ht-MMAapdFy2pXw@mail.gmail.com/T/
[2] https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#m4af4473b94f98a4996cb11756b633a07e5e059d1

Hsin-Yi Wang (2):
  Revert "squashfs: provide backing_dev_info in order to disable
    read-ahead"
  squashfs: implement readahead

Phillip Lougher (1):
  squashfs: always build "file direct" version of page actor

 fs/squashfs/Makefile     |  4 +-
 fs/squashfs/file.c       | 91 +++++++++++++++++++++++++++++++++++++++-
 fs/squashfs/page_actor.h | 41 ------------------
 fs/squashfs/super.c      | 33 ---------------
 4 files changed, 92 insertions(+), 77 deletions(-)

-- 
2.36.1.124.g0e6072fb45-goog



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
